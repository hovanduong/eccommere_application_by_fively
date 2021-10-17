import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/presentation.dart';
import 'package:flutter_app/src/resource/responsitory/authenticate_responsitory.dart';
import 'package:flutter_app/src/utils/app_string.dart';
import 'package:flutter_app/src/utils/app_valid.dart';
import 'package:get/get.dart';

class SignInViewModel extends BaseViewModel {
  final emaiTextEditingController = TextEditingController();
  final passwrodTextEditingController = TextEditingController();
  String emailError = "";
  String passwordError = "";
  AuthenticateResponsitory authenticateResponsitory =
      new AuthenticateResponsitory();
  intial() async {}

  validationName() {
    emailError = AppValid.validateEmail(emaiTextEditingController.text.trim());
    passwordError =
        AppValid.validatePassword(passwrodTextEditingController.text.trim());
    notifyListeners();
  }

  onLogin() async {
    setLoading(true);
    if (!StringUtils.isNullOrEmpty(emailError) &&
        !StringUtils.isNullOrEmpty(passwordError)) {
      String email = emaiTextEditingController.text.trim();
      String password = passwrodTextEditingController.text.trim();

      bool result = await authenticateResponsitory.loginResponse(
          email: email, password: password);
      setLoading(false);
      result
          // ignore: unnecessary_statements
          ? {
              showSuccessNotifi("Login is Successfull!"),
              Get.offAllNamed(Routers.home)
            }
          : showError("Login fiel");
    }
  }
}
