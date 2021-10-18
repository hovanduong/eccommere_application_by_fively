import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/utils/app_pref.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class SettingsViewModel extends BaseViewModel {
  BehaviorSubject<int> themeSubject = new BehaviorSubject<int>();

  initial() async {
    themeSubject.add(AppPref.themeValue);
    log("themeValue ${AppPref.themeValue}");
  }

  Stream<int> get selectThemeSteaam => themeSubject.stream;

  onChangeTheme(String? value) {
    if (value != null && value != "") {
      if (value == "Light") {
        AppPref.themeValue = 1;
        Get.changeThemeMode(ThemeMode.light);
        themeSubject..add(1);
        return;
      }

      if (value == "Dark") {
        AppPref.themeValue = 2;
        Get.changeThemeMode(ThemeMode.dark);
        themeSubject..add(2);
        return;
      }
    }
    AppPref.themeValue = 0;
    Get.changeThemeMode(ThemeMode.system);
    themeSubject..add(0);
    return;
  }

  @override
  void dispose() {
    super.dispose();
    themeSubject.close();
  }
}
