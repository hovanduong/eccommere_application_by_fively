import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/routers.dart';
import 'package:flutter_app/src/resource/responsitory/authenticate_responsitory.dart';
import 'package:flutter_app/src/utils/app_string.dart';
import 'package:flutter_app/src/utils/app_valid.dart';
import 'package:get/get.dart';

class SignUpViewModel extends BaseViewModel {
  final firstNameTextEditingController = TextEditingController();
  final lastNameTextEditingController = TextEditingController();
  final emaiTextEditingController = TextEditingController();
  final passwrordTextEditingController = TextEditingController();
  final passwrordConfirmTextEditingController = TextEditingController();
  String firstnameError = "";
  String lastNameError = "";
  String emailError = "";
  String passwordError = "";
  String passwordConfirmError = "";

  AuthenticateResponsitory authenticateResponsitory =
      new AuthenticateResponsitory();

  intial() async {
    // validationName();
    // setLoading(true);
    // showError("Lỗi rồi!");
  }

  validationName() {
    firstnameError = AppValid.validateRequired(
        firstNameTextEditingController.text.trim(), 'first_name_required'.tr);
    lastNameError = AppValid.validateRequired(
        lastNameTextEditingController.text.trim(), 'last_name_required'.tr);
    emailError = AppValid.validateEmail(emaiTextEditingController.text.trim());
    passwordError =
        AppValid.validatePassword(passwrordTextEditingController.text.trim());

    passwordConfirmError = AppValid.validatePasswordConfirm(
        passwrordTextEditingController.text.trim(),
        passwrordConfirmTextEditingController.text.trim());

    notifyListeners();
  }

  void onSignUp() async {
    setLoading(true);
    validationName();
    String firstName = firstNameTextEditingController.text.trim();
    String lastName = lastNameTextEditingController.text.trim();
    String email = emaiTextEditingController.text.trim();
    String password = passwrordTextEditingController.text.trim();
    String passwordConfirm = passwrordConfirmTextEditingController.text.trim();

    if (!StringUtils.isNullOrEmpty(emailError) &&
        !StringUtils.isNullOrEmpty(firstnameError) &&
        !StringUtils.isNullOrEmpty(lastNameError) &&
        !StringUtils.isNullOrEmpty(passwordError) &&
        !StringUtils.isNullOrEmpty(passwordConfirmError)) {
      String result = await authenticateResponsitory.registerResponse(
          firstName, lastName, email, password, passwordConfirm);
      if (result == "") {
        setLoading(false);
        showSuccessNotifi("Register successfull!");
        Get.offAllNamed(Routers.home);
      } else {
        setLoading(false);
        showError(result);
      }
    } else {
      setLoading(false);
      showError("Please check your input!");
    }
  }
}
