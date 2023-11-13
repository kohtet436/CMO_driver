import '../../model/login_response.dart';
import '../../remote/vms_api_service.dart';
import '../../model/base_response.dart';

abstract class LogInRemoteDataSource {
  Future<BaseResponse<LogInResponse>> logIn(
      String driverNumber, String password);
}

class LogInRemoteDataSourceImpl extends LogInRemoteDataSource {
  final VmsApiService vmsApiService;

  LogInRemoteDataSourceImpl({required this.vmsApiService});

  @override
  Future<BaseResponse<LogInResponse>> logIn(
      String driverNumber, String password) {
    return vmsApiService.logIn(driverNumber, password);
  }
}
