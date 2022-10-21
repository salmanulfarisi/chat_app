import 'package:chat_app/modules/individual_chat.dart/controller/controller.dart';
import 'package:get/get.dart';

class IndividualBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndividualController>(() => IndividualController());
  }
}
