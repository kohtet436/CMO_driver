import 'package:dartz/dartz.dart';

import '../model/request_models/update_employee_attendance_request.dart';
import '../../core/helper/response_handler.dart';
import '../model/daily_route_employee.dart';
import '../model/response_error.dart';
import '../source/remote/employee_remote_data_source.dart';

abstract class EmployeeRepository {
  Future<Either<List<DailyRouteEmployee>, ResponseError>>
      getDailyRouteEmployeeList(String id);
  Future<Either<List, ResponseError>> updateDailyRouteEmployeeAttendance(
    List<UpdateEmployeeAttendanceRequest> updateEmployeeAttendanceRequestList,
  );
}

class EmployeeRepositoryImpl extends EmployeeRepository {
  final EmployeeRemoteDataSource remoteDataSource;

  EmployeeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<List<DailyRouteEmployee>, ResponseError>>
      getDailyRouteEmployeeList(String id) async {
    final response = await remoteDataSource.getDailyRouteEmployeeList(id);
    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold((data) {
      return Left(data);
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<List, ResponseError>> updateDailyRouteEmployeeAttendance(
    List<UpdateEmployeeAttendanceRequest> updateEmployeeAttendanceRequestList,
  ) async {
    final response = await remoteDataSource
        .updateDailyRouteEmployeeStatus(updateEmployeeAttendanceRequestList);
    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold((data) {
      return Left(data);
    }, (error) {
      return Right(error);
    });
  }
}
