import 'package:cmo_driver/app/core/helper/app_enum.dart';
import 'package:get/get.dart';

import '../../../data/model/daily_route_employee.dart';
import '../../../core/helper/constant.dart';
import '../../../core/helper/helper.dart';
import '../../../data/model/response_models/daily_route.dart';
import '../../../data/model/response_models/daily_route_ferry_stop.dart';
import '../../../data/repository/daily_route_repository.dart';

class HomeController extends GetxController {
  final currentSequenceNumber = 0.obs;
  final nextSequenceNumber = 1.obs;

  final nextFerryStop = Rxn<DailyRouteFerryStop>();

  final dailyRoute = Rxn<DailyRoute>();

  final isLoading = false.obs;

  final DailyRouteRepository dailyRouteRepository = Get.find();

  final isCheckedIn = false.obs;

  void getDailyRoute() async {
    try {
      isLoading(true);

      final dailyRouteData = await dailyRouteRepository.getDailyRoute();
      dailyRouteData.fold(
        (data) {
          dailyRoute(data);
        },
        (error) => Helper.console(error.message),
      );
    } finally {
      isLoading(false);
    }
  }

  void startEndRoute(String dailyRouteId) async {
    try {
      isLoading(true);

      final dailyRouteData =
          await dailyRouteRepository.startEndRoute(dailyRouteId);
      dailyRouteData.fold(
        (data) {
          dailyRoute(data);
        },
        (error) => Helper.console(error.message),
      );
    } finally {
      isLoading(false);
    }
  }

  void checkInOut(String dailyRouteId, String ferryStopId) async {
    try {
      isLoading(true);

      final dailyRouteData =
          await dailyRouteRepository.checkInOut(dailyRouteId, ferryStopId);
      dailyRouteData.fold(
        (data) {
          Helper.console('Checked in/out successfully');
          dailyRoute(data);
        },
        (error) => Helper.console(error.message),
      );
    } finally {
      isLoading(false);
    }
  }

  void syncData() {
    // Sort the sequence numbers
    dailyRoute.value!.ferryStops.sort(
      (a, b) => a.sequenceNumber.compareTo(b.sequenceNumber),
    );

    // Syncing current sequence number
    if (dailyRoute.value!.lastFerryStopId != DEFAULT_ID) {
      currentSequenceNumber(dailyRoute.value!.ferryStops
          .firstWhere(
              (ferryStop) => ferryStop.id == dailyRoute.value!.lastFerryStopId)
          .sequenceNumber);
    } else {
      currentSequenceNumber(0);
    }

    // Syncing next sequence number
    if (dailyRoute.value!.ferryStops.last.sequenceNumber ==
        currentSequenceNumber.value) {
      nextSequenceNumber(-1);
    } else {
      nextSequenceNumber.value = currentSequenceNumber.value + 1;

      while (isFerryStopBlank(nextSequenceNumber.value)) {
        nextSequenceNumber.value += 1;
        if (nextSequenceNumber.value >
            dailyRoute.value!.ferryStops.last.sequenceNumber) {
          nextSequenceNumber(-1);
        }
      }
    }

    // Syncing next ferry stop
    if (nextSequenceNumber.value != -1) {
      nextFerryStop(dailyRoute.value!.ferryStops.firstWhere(
          (ferryStop) => ferryStop.sequenceNumber == nextSequenceNumber.value));
    }

    // Checking whether check in or check out function should be performed
    if (dailyRoute.value!.lastFerryStopId != DEFAULT_ID) {
      isCheckedIn(dailyRoute.value!.ferryStops
              .firstWhere((ferryStop) =>
                  ferryStop.id == dailyRoute.value!.lastFerryStopId)
              .checkOutTime
              .toIso8601String() ==
          DEFAULT_TIME);
    }
  }

  // void findNextSequenceNumber() {

  //   if (dailyRoute.value!.lastFerryStop == null) {
  //     return 1;
  //   } else if (dailyRoute.value!.lastFerryStopId ==
  //       dailyRoute.value!.ferryStops.last.ferryStopId) {
  //     return -1;
  //   } else {
  //     int nextSequence = dailyRoute.value!.ferryStops
  //         .firstWhere(
  //           (ferryStop) =>
  //               ferryStop.ferryStopId == dailyRoute.value!.lastFerryStopId,
  //         )
  //         .sequenceNumber;

  //     if (dailyRoute.value!.ferryStops
  //             .firstWhere(
  //                 (ferryStop) => ferryStop.sequenceNumber == nextSequence)
  //             .checkOutTime
  //             .toIso8601String() !=
  //         DEFAULT_TIME) {
  //       nextSequence = nextSequence + 1;
  //     }

  //     while (isFerryStopBlank(nextSequence)) {
  //       nextSequence = nextSequence + 1;
  //       if (nextSequence == dailyRoute.value!.ferryStops.last.sequenceNumber) {
  //         return -1;
  //       }
  //     }
  //     return nextSequence;
  //   }
  // }

  bool isFerryStopBlank(int sequenceNumber) {
    final DailyRouteFerryStop ferryStop = dailyRoute.value!.ferryStops
        .firstWhere((ferryStop) => ferryStop.sequenceNumber == sequenceNumber);
    for (DailyRouteEmployee employee in ferryStop.employees) {
      if (employee.status != EmployeeAttendance.LEAVE) {
        return false;
      }
    }
    return true;
  }

  @override
  void onInit() {
    getDailyRoute();
    ever(dailyRoute, (callback) => syncData());
    super.onInit();
  }
}
