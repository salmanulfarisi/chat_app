import 'dart:async';

import 'package:chat_app/modules/welcome/view/view.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final getStorage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 6), () {
      if (getStorage.read('id') != null) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAll(() => const WelcomeView());
      }
    });
    // Timer(const Duration(seconds: 6), () => Get.off(() => const WelcomeView()));
  }
}
