import 'dart:developer';

import 'package:chat_app/core/utils/extentions.dart';
import 'package:chat_app/modules/login/controller/controller.dart';
import 'package:chat_app/modules/signup/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(6.0.wp),
          child: Center(
            child: Form(
              key: controller.loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/authPic.svg", height: 50.0.wp),
                  SizedBox(height: 5.0.wp),
                  Text(
                    "Welcome to Chat App",
                    style: TextStyle(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0.wp),
                  Text(
                    "Login to continue",
                    style: TextStyle(
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5.0.wp),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0.wp),
                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0.wp),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 20.0.wp),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      controller.login();
                      log("pressed");
                    },
                    child: const Text("Login"),
                  ),
                  SizedBox(height: 10.0.wp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 10.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.off(() => const SignupView());
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
