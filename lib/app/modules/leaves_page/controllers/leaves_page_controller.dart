import 'package:get/get.dart';

import '../../../core/helper/app_enum.dart';
import '../../../core/helper/helper.dart';
import '../../../data/model/driver_leave.dart';
import '../../../data/model/vehicle_leave.dart';
import '../../../data/repository/leave_repository.dart';
import '../../../routes/app_pages.dart';

class LeavesPageController extends GetxController {
  final driverLeaveList = <DriverLeave>[].obs;
  final vehicleLeaveList = <VehicleLeave>[].obs;

  final currentIndex = 0.obs;

  final isLoadingDriver = false.obs;
  final isLoadingVehicle = false.obs;

  final isPendingDriverLeave = false.obs;
  final pendingDriverLeave = Rxn<DriverLeave>();

  final isPendingVehileLeave = false.obs;
  final pendingVehicleLeave = Rxn<VehicleLeave>();

  final LeaveRepository leaveRepository = Get.find();

  void getDriverLeaves() async {
    try {
      isLoadingDriver(true);
      final driverLeavesData = await leaveRepository.getDriverLeaves();
      driverLeavesData.fold(
        (data) {
          driverLeaveList(data);
          for (var leave in driverLeaveList) {
            if (leave.leaveStatus == 'Pending') {
              pendingDriverLeave.value = leave;
              driverLeaveList.remove(leave);
              isPendingDriverLeave(true);
              break;
            }
          }
        },
        (error) => Helper.console(error.message),
      );
    } finally {
      isLoadingDriver(false);
    }
  }

  void getVehicleLeaves() async {
    try {
      isLoadingVehicle(true);
      final vehicleLeavesData = await leaveRepository.getVehicleLeaves();
      vehicleLeavesData.fold(
        (data) {
          vehicleLeaveList(data);
          for (var leave in vehicleLeaveList) {
            if (leave.leaveStatus == 'Pending') {
              pendingVehicleLeave.value = leave;
              vehicleLeaveList.remove(leave);
              isPendingVehileLeave(true);
              break;
            }
          }
        },
        (error) => Helper.console(error.message),
      );
    } finally {
      isLoadingVehicle(false);
    }
  }

  void cancelDriverLeave(String id) async {
    try {
      isLoadingDriver(true);
      final driverLeavesData = await leaveRepository.cancelDriverLeave(id);
      driverLeavesData.fold(
        (data) {
          isPendingDriverLeave(false);
          isPendingVehileLeave(false);
          fetchData();
        },
        (error) => Helper.console(error.message),
      );
    } finally {
      isLoadingDriver(false);
    }
  }

  void cancelVehicleLeave(String id) async {
    try {
      isLoadingDriver(true);
      final vehicleLeaveData = await leaveRepository.cancelVehicleLeave(id);
      vehicleLeaveData.fold(
        (data) {
          isPendingDriverLeave(false);
          isPendingVehileLeave(false);
          fetchData();
        },
        (error) => Helper.console(error.message),
      );
    } finally {
      isLoadingDriver(false);
    }
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  bool isDriverLeave() {
    return currentIndex.value == 0;
  }

  bool isVehicleLeave() {
    return currentIndex.value == 1;
  }

  void goToLeaveRequestPage() async {
    await Get.toNamed(
      Routes.LEAVE_REQUEST_PAGE,
      arguments: {
        'leaveType': currentIndex.value == 0
            ? LeaveType.DRIVER_LEAVE
            : LeaveType.VEHICLE_LEAVE,
        'isPendingDriverLeave': isPendingDriverLeave.value,
        'isPendingVehicleLeave': isPendingVehileLeave.value,
      },
    );

    fetchData();
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    getDriverLeaves();
    getVehicleLeaves();
  }
}
