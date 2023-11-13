import 'package:get/get.dart';

import '../../../core/helper/helper.dart';
import '../../../data/model/response_models/daily_route_ferry_stop.dart';
import '../../../data/repository/daily_route_repository.dart';

class DailyRouteFerryStopListPageController extends GetxController {
  final isLoading = false.obs;

  final dailyRouteFerryStops = <DailyRouteFerryStop>[].obs;

  final DailyRouteRepository dailyRouteRepository = Get.find();

  void getDailyRoute() async {
    try {
      isLoading(true);

      final dailyRouteData = await dailyRouteRepository.getDailyRoute();
      dailyRouteData.fold(
        (data) {
          dailyRouteFerryStops.assignAll(data.ferryStops);
          dailyRouteFerryStops.sort(
            (a, b) => a.sequenceNumber.compareTo(b.sequenceNumber),
          );
        },
        (error) => Helper.console(error.message),
      );
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getDailyRoute();
    super.onInit();
  }
}
