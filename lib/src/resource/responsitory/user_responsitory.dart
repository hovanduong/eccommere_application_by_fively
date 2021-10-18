import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_app/src/resource/model/user_model.dart';
import 'package:flutter_app/src/utils/app_clients.dart';

class UserResponsitory {
  UserResponsitory._();

  static UserResponsitory? _instance;

  factory UserResponsitory() {
    if (_instance == null) _instance = UserResponsitory._();
    return _instance!;
  }

  Future<UserModel> getUserProfileRepons() async {
    try {
      String url = "user/profile";
      Response response = await AppClients()
          .get(url, options: Options(headers: {"token": "token"}));

      if (response.statusCode == 200) {
        UserModel userModel = UserModel.fromJson(response.data['data']);
        log("userModel ${userModel.email}");
        return userModel;
      } else {
        return UserModel(
          id: "",
          firstName: "",
          lastName: "",
          email: "",
          avatar: "",
          phoneNumber: "",
        );
      }
    } catch (e) {
      log("userModel ${e.toString()}");
      return UserModel(
        id: "",
        firstName: "",
        lastName: "",
        email: "",
        avatar: "",
        phoneNumber: "",
      );
    }
  }
}
