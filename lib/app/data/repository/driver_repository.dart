import 'dart:async';
import 'package:dartz/dartz.dart';

import '../model/driver_update_profile.dart';
import '../model/response_error.dart';
import '../source/remote/driver_remote_data_source.dart';
import '../../core/helper/response_handler.dart';
import '../model/driver.dart';

abstract class DriverRepository {
  Future<Either<Driver, ResponseError>> getDriver();
  Future<Either<Driver, ResponseError>> updateDriver(
      DriverUpdateProfile driverUpdateProfile);
}

class DriverRepositoryImpl extends DriverRepository {
  final DriverRemoteDataSource remoteDataSource;

  DriverRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Driver, ResponseError>> getDriver() async {
    final response = await remoteDataSource.getDriver();
    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold((data) {
      return Left(data[0]);
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<Driver, ResponseError>> updateDriver(
      DriverUpdateProfile driverUpdateProfile) async {
    final response = await remoteDataSource.updateDriver(driverUpdateProfile);
    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold((data) {
      return Left(data[0]);
    }, (error) {
      return Right(error);
    });
  }
}
