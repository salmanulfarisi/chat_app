import 'package:chat_app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final storage = GetStorage();

  void logout() {
    storage.erase();
    Get.offAllNamed(Routes.LOGIN);
  }
}
