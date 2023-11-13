import '../../remote/rms_api_service.dart';
import '../../model/base_response.dart';
import '../../model/base_route.dart';

abstract class BaseRouteRemoteDataSource {
  Future<BaseResponse<BaseRoute>> getBaseRoute(String id);
  Future<BaseResponse<String>> getBaseRouteId(String id);
}

class BaseRouteRemoteDataSourceImpl extends BaseRouteRemoteDataSource {
  final RmsApiService rmsApiService;
  BaseRouteRemoteDataSourceImpl({required this.rmsApiService});

  @override
  Future<BaseResponse<BaseRoute>> getBaseRoute(String id) {
    return rmsApiService.getBaseRoute(id);
  }

  @override
  Future<BaseResponse<String>> getBaseRouteId(String id) {
    return rmsApiService.getBaseRouteId(id);
  }
}
