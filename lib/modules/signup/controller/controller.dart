import 'package:chat_app/data/model/signup/signup_model.dart';
import 'package:chat_app/data/model/signup/signup_response_model.dart';
import 'package:chat_app/modules/signup/service/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
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
    final form = signupFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void signup() async {
    final data = SignupModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text);
    SignupResponseModel? response = await SignUpService().signupUser(data);
    if (response != null) {
      Get.snackbar("Success", "${response.name} your account has been created");
    } else {
      Get.snackbar("Error", "Something went wrong");
    }
  }
}
