import 'dart:developer';

import 'package:dio/dio.dart' as DIO;
import 'package:flutter_app/src/utils/app_clients.dart';
import 'package:flutter_app/src/utils/app_pref.dart';
import 'package:get/get.dart';

class AuthenticateResponsitory {
  AuthenticateResponsitory._();

  static AuthenticateResponsitory? _instance;

  factory AuthenticateResponsitory() {
    if (_instance == null) _instance = AuthenticateResponsitory._();
    return _instance!;
  }

  Future<String> registerResponse(String firstName, String lastName,
      String email, String password, String passwordConfirm) async {
    try {
      String url = "auth/register";

      DIO.Response response = await AppClients().post(url, data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "passwordConfirm": passwordConfirm,
      });
      log("registerResponse response:${response.data}");
      if (response.statusCode == 200) {
        if (response.data["status"] == 301) {
          return "email_is_exists".tr;
        }

        if (response.data["status"] == 302) {
          return "phone_number_is_exists".tr;
        }

        if (response.data["status"] == 200) {
          AppPref.accessToken = response.data["data"]["successToken"];
          AppPref.firstName = response.data["data"]["firstName"];
          AppPref.lastName = response.data["data"]["lastName"];
          return "";
        }
      }

      return "ERROR";
    } catch (e) {
      log("registerResponse error: ${e.toString()}");
      return "ERROR";
    }
  }

  Future<bool> loginResponse(
      {required String email, required String password}) async {
    try {
      String url = "auth/login";
      DIO.Response response = await AppClients().post(url, data: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        AppPref.accessToken = response.data["data"]["successToken"];
        AppPref.firstName = response.data["data"]["firstName"];
        AppPref.lastName = response.data["data"]["lastName"];
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> serectResponse() async {
    try {
      String url = "auth/serect";
      DIO.Response response = await AppClients()
          .get(url, options: DIO.Options(headers: {"token": "token"}));
      return response.statusCode == 200 ? true : false;
    } catch (e) {
      return false;
    }
  }
}
