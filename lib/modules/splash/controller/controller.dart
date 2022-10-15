import 'dart:async';

import 'package:chat_app/modules/login/view/view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  int a = 10;
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 6), () => Get.off(() => const LoginView()));
  }
}
