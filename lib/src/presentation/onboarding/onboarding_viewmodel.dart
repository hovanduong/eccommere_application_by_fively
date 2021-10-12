import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/resource/model/model.dart';

class OnboadringViewModel extends BaseViewModel {
  List<OnboardingModel>? listOnboards;
  // ScrollController? controller;

  var curentPage = 0;
  var pageviewController = new PageController(
    initialPage: 0,
  );

  init() async {
    //get fake list onboarding
    listOnboards = OnboardingModel.fakeOnboarding();
    // controller = ScrollController();
    autoNextPage();
  }

  autoNextPage() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (curentPage < listOnboards!.length - 1) {
        curentPage = curentPage + 1;
      }
      // if (controller!.hasClients) {
      pageviewController.animateToPage(curentPage,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
      // }
    });
    notifyListeners();
  }

  onPageChange(int index) {
    curentPage = index;
    notifyListeners();
  }
}
