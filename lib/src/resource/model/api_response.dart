import 'package:flutter_app/src/resource/model/base_response_model.dart';
import 'package:flutter_app/src/resource/model/login_model.dart';

class ApiResponse<T> {
  int? status;
  String? message;
  bool? success;
  T? data;

  ApiResponse._fromJson(Map<String, dynamic> json)
      : message = json['message'],
        status = json['status'],
        success = json['success'];

  factory ApiResponse.fromJson(Map<String, dynamic> jsonData) {
    switch (T) {
      case LoginModel:
      // return LoginModel.formJson(jsonData) as ApiResponse<T>;
      default:
        throw UnsupportedError('Not Supported Type');
    }
  }
}
