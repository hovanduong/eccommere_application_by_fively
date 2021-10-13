import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/presentation/base/base.dart';

class SignInViewModel extends BaseViewModel {
  final nameTextEditingController = TextEditingController();
  final emaiTextEditingController = TextEditingController();
  final passwrodTextEditingController = TextEditingController();
  String nameError = "";
  String emailError = "";
  String passwordError = "";
  intial() async {}

  validationName() {
    if (nameTextEditingController.text.isEmpty) {
      nameError = "Name requried";
    } else if (nameTextEditingController.text.length < 8) {
      nameError = "Name requried";
    } else {
      nameError = "";
    }
    notifyListeners();
  }
}
