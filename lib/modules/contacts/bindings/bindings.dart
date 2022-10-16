import 'package:chat_app/modules/contacts/controller/controller.dart';
import 'package:get/get.dart';

class ContactsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactsController>(() => ContactsController());
  }
}
