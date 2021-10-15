import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';

class AppValid {
  AppValid._();

  static validatePhone() {
    return (value) {
      if (value == null || value.length == 0) return 'valid_enter_phone'.tr;
      RegExp regex = new RegExp(r'^(?:[+0]9)?[0-9]{10}$');
      if (!regex.hasMatch(value)) return 'valid_phone'.tr;
    };
  }

  static validateFullName() {
    return (value) {
      if (value == null || value.length == 0) {
        return 'valid_full_name'.tr;
      }
      return null;
    };
  }

  static validateEmail(value) {
    if (value == null || value.length == 0) {
      return 'email_required'.tr;
    } else {
      RegExp regex = new RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
      if (!regex.hasMatch(value))
        return 'email_invalid'.tr;
      else
        return "";
    }
    ;
  }

  static validatePassword(String value) {
    if (value == null || value.length < 6) {
      return 'passord_required'.tr;
    } else {
      RegExp regex = new RegExp(r'^[0-9a-zA-Z!@#\$&*~]{6,}$');
      if (!regex.hasMatch(value))
        return 'passord_invalid'.tr;
      else
        return "";
    }
  }

  static validatePasswordConfirm(String password, String passwordConfirm) {
    if (password == null || password.length == 0) {
      return 'passord_confirm_required'.tr;
    } else if (passwordConfirm != password)
      return 'passord_confirm_not_match'.tr;
    else {
      return "";
    }
  }

  static validatePhoneNumber() {
    RegExp regex = new RegExp(r'^(?:[+0]9)?[0-9]{10}$');

    return (value) {
      if (value == null || value.length == 0) {
        return 'valid_enter_phone'.tr;
      } else if (value.length != 10) {
        return 'valid_phone'.tr;
      } else if (!regex.hasMatch(value)) {
        return 'valid_phone'.tr;
      } else {
        return null;
      }
    };
  }

  static String validateRequired(value, message) {
    if (value == null || value.length == 0) {
      return message;
    }
    return "";
  }
}
