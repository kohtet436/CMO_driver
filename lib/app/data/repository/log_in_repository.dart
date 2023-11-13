import 'package:dartz/dartz.dart';

import '../model/login_response.dart';
import '../source/remote/log_in_remote_data_source.dart';
import '../../core/helper/response_handler.dart';
import '../model/response_error.dart';

abstract class LogInRepository {
  Future<Either<LogInResponse, ResponseError>> logIn(
      String driverNumber, String password);
}

class LogInRepositoryImpl extends LogInRepository {
  final LogInRemoteDataSource remoteDataSource;

  LogInRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<LogInResponse, ResponseError>> logIn(
      String driverNumber, String password) async {
    final response = await remoteDataSource.logIn(driverNumber, password);
    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold((data) {
      return Left(data[0]);
    }, (error) {
      return Right(error);
    });
  }
}
