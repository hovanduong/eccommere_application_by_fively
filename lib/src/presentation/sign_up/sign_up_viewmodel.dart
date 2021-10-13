import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/presentation/base/base.dart';

class SignUpViewModel extends BaseViewModel {
  final nameTextEditingController = TextEditingController();
  final emaiTextEditingController = TextEditingController();
  String nameError = "";
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
