import 'package:dartz/dartz.dart';

import '../../data/model/base_response.dart';
import '../../data/model/response_error.dart';

class ResponseHandler {
  Either<dynamic, ResponseError> checkResponse(BaseResponse response) {
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return Left(
        response.data,
      );
    } else {
      return Right(
        ResponseError(
            statusCode: response.statusCode, message: response.message),
      );
    }
  }
}
