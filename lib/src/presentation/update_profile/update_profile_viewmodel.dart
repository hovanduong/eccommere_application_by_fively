import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/resource/model/user_model.dart';
import 'package:get/get.dart';

class UpdateProfileViewModel extends BaseViewModel {
  TextEditingController firstNameContoller = new TextEditingController();
  TextEditingController firstNameEditContoller = new TextEditingController();
  TextEditingController lasttNameContoller = new TextEditingController();
  TextEditingController emailContoller = new TextEditingController();
  TextEditingController passwordController =
      new TextEditingController(text: "...........");

  initial() async {
    UserModel profile = Get.arguments["profile"];
    log("Get.arguments ${profile.email}");
  }

  initInput(UserModel? user) {
    firstNameContoller.text = user!.firstName;
    lasttNameContoller.text = user.lastName;
    emailContoller.text = user.email;
  }
}
