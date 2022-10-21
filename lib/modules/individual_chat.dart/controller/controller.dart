import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class IndividualController extends GetxController {
  RxBool showEmojiPicker = false.obs;
  FocusNode focusNode = FocusNode();
  RxBool sendButtonEnabled = false.obs;
  late TextEditingController textEditingController;

  @override
  void onInit() {
    super.onInit();
    textEditingController = TextEditingController();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        showEmojiPicker.value = false;
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    textEditingController.dispose();
    focusNode.dispose();
  }
}
