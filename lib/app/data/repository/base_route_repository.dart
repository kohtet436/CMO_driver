import 'package:dartz/dartz.dart';

import '../../core/helper/response_handler.dart';
import '../model/response_error.dart';
import '../source/remote/base_route_remote_data_source.dart';
import '../model/base_route.dart';

abstract class BaseRouteRepository {
  Future<Either<BaseRoute, ResponseError>> getBaseRoute(String id);
  Future<Either<String, ResponseError>> getBaseRouteId(String id);
}

class BaseRouteRepositoryImpl extends BaseRouteRepository {
  final BaseRouteRemoteDataSource baseRouteRemoteDataSource;

  BaseRouteRepositoryImpl({required this.baseRouteRemoteDataSource});

  @override
  Future<Either<BaseRoute, ResponseError>> getBaseRoute(String id) async {
    final response = await baseRouteRemoteDataSource.getBaseRoute(id);
    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold(
      (data) => Left(data[0]),
      (error) => Right(error),
    );
  }

  @override
  Future<Either<String, ResponseError>> getBaseRouteId(String id) async {
    final response = await baseRouteRemoteDataSource.getBaseRouteId(id);
    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold(
      (data) => Left(data[0]),
      (error) => Right(error),
    );
  }
}
