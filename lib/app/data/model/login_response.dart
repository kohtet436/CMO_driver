class LogInResponse {
  final String token;

  LogInResponse({required this.token});

  factory LogInResponse.fromJson(Map<String, dynamic> json) => LogInResponse(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
