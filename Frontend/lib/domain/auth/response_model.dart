class ErrorReponse {
  String message;
  ErrorReponse(this.message);

  factory ErrorReponse.fromJson(Map<String, dynamic> json) {
    return ErrorReponse(
      json['message'],
    );
  }
}
