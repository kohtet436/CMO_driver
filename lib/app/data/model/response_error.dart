class ResponseError {
  int statusCode;
  String message;

  ResponseError({required this.statusCode, required this.message});

  factory ResponseError.fromJson(Map<String, dynamic> json) => ResponseError(
        statusCode: json["statusCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
      };
}
