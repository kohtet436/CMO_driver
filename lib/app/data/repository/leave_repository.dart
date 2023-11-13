import 'package:dartz/dartz.dart';

import '../model/driver_leave_request.dart';
import '../model/vehicle_leave_request.dart';
import '../../core/helper/response_handler.dart';
import '../model/driver_leave.dart';
import '../model/response_error.dart';
import '../model/vehicle_leave.dart';
import '../source/remote/driver_leave_remote_data_source.dart';
import '../source/remote/vehicle_leave_remote_data_source.dart';

abstract class LeaveRepository {
  Future<Either<List<DriverLeave>, ResponseError>> getDriverLeaves();
  Future<Either<List<VehicleLeave>, ResponseError>> getVehicleLeaves();
  Future<Either<DriverLeave, ResponseError>> requestDriverLeave(
      DriverLeaveRequest driverLeaveRequest);
  Future<Either<VehicleLeave, ResponseError>> requestVehicleLeave(
      VehicleLeaveRequest vehicleLeaveRequest);
  Future<Either<DriverLeave, ResponseError>> cancelDriverLeave(String id);
  Future<Either<VehicleLeave, ResponseError>> cancelVehicleLeave(String id);
}

class LeaveRepositoryImpl extends LeaveRepository {
  final DriverLeaveRemoteDataSource driverLeaveRemoteDataSource;
  final VehicleLeaveRemoteDataSource vehicleLeaveRemoteDataSource;
  LeaveRepositoryImpl({
    required this.driverLeaveRemoteDataSource,
    required this.vehicleLeaveRemoteDataSource,
  });

  @override
  Future<Either<List<DriverLeave>, ResponseError>> getDriverLeaves() async {
    final response = await driverLeaveRemoteDataSource.getDriverLeaves();
    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold(
      (data) => Left(data),
      (error) => Right(error),
    );
  }

  @override
  Future<Either<List<VehicleLeave>, ResponseError>> getVehicleLeaves() async {
    final response = await vehicleLeaveRemoteDataSource.getVehicleLeaves();
    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold(
      (data) => Left(data),
      (error) => Right(error),
    );
  }

  @override
  Future<Either<DriverLeave, ResponseError>> requestDriverLeave(
      DriverLeaveRequest driverLeaveRequest) async {
    final response = await driverLeaveRemoteDataSource
        .requestDriverLeave(driverLeaveRequest);
    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold(
      (data) => Left(data[0]),
      (error) => Right(error),
    );
  }

  @override
  Future<Either<VehicleLeave, ResponseError>> requestVehicleLeave(
      VehicleLeaveRequest vehicleLeaveRequest) async {
    final response = await vehicleLeaveRemoteDataSource
        .requestVehicleLeave(vehicleLeaveRequest);
    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold(
      (data) => Left(data[0]),
      (error) => Right(error),
    );
  }

  @override
  Future<Either<DriverLeave, ResponseError>> cancelDriverLeave(
      String id) async {
    final response = await driverLeaveRemoteDataSource.cancelDriverLeave(id);
    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold(
      (data) => Left(data[0]),
      (error) => Right(error),
    );
  }

  @override
  Future<Either<VehicleLeave, ResponseError>> cancelVehicleLeave(
      String id) async {
    final response = await vehicleLeaveRemoteDataSource.cancelVehicleLeave(id);
    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold(
      (data) => Left(data[0]),
      (error) => Right(error),
    );
  }
}
