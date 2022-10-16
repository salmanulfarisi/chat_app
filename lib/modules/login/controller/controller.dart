import 'package:chat_app/data/model/login/login_model.dart';
import 'package:chat_app/data/model/login/login_response.dart';
import 'package:chat_app/modules/home/view/view.dart';
import 'package:chat_app/modules/login/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide a valid Email";
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be 6 characters";
    } else {
      return null;
    }
  }

  bool validateAndSave() {
    final form = loginFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void login() async {
    final data = LoginModel(
        email: emailController.text, password: passwordController.text);
    LoginResponseModel? response = await LoginService().loginUser(data);
    if (response != null) {
      Get.snackbar("Login", "${response.name} Login Successfully");
      Get.offAll(() => const Homeview());
    } else {
      Get.snackbar("Login", "Something went wrong");
    }
  }
}
