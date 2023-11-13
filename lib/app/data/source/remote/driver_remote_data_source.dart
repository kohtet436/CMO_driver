import '../../model/driver_update_profile.dart';
import '../../remote/vms_api_service.dart';
import '../../model/base_response.dart';
import '../../model/driver.dart';

abstract class DriverRemoteDataSource {
  Future<BaseResponse<Driver>> getDriver();
  Future<BaseResponse<Driver>> updateDriver(
      DriverUpdateProfile driverUpdateProfile);
}

class DriverRemoteDataSourceImpl extends DriverRemoteDataSource {
  final VmsApiService vmsApiService;

  DriverRemoteDataSourceImpl({required this.vmsApiService});

  @override
  Future<BaseResponse<Driver>> getDriver() {
    return vmsApiService.getDriver();
  }

  @override
  Future<BaseResponse<Driver>> updateDriver(
      DriverUpdateProfile driverUpdateProfile) {
    return vmsApiService.updateDriver(driverUpdateProfile);
  }
}
