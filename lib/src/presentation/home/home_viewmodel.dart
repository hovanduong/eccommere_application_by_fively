import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/resource/model/navigation_model.dart';

class HomeViewModel extends BaseViewModel {
  List<NavigationModel> navigations = navidationData();
  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);
  inittal() async {
    pageController.addListener(() {});
  }

  onPageChange(int page) {
    if (currentPage != page) {
      currentPage = page;
      pageController.animateToPage(currentPage,
          duration: Duration(milliseconds: 1), curve: Curves.easeIn);
    }
    notifyListeners();
  }
}
