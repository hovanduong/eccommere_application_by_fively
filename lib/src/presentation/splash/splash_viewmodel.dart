import 'package:flutter_app/src/resource/responsitory/authenticate_responsitory.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../presentation.dart';

class SplashViewModel extends BaseViewModel {
  AuthenticateResponsitory authenticateResponsitory =
      new AuthenticateResponsitory();
  init() async {
    EasyLoading.show(status: 'loading...');
    Future.delayed(Duration(seconds: 3), () async {
      bool result = await authenticateResponsitory.serectResponse();
      result
          ? Get.offAndToNamed(Routers.home)
          : Get.offAndToNamed(Routers.register);
    });
    EasyLoading.dismiss();
  }
}
