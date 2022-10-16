import 'package:chat_app/core/utils/extentions.dart';
import 'package:chat_app/modules/login/view/view.dart';
import 'package:chat_app/modules/signup/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(6.0.wp),
            child: Center(
              child: Form(
                key: controller.signupFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/authPic.svg', height: 50.0.wp),
                    SizedBox(height: 5.0.wp),
                    Text(
                      'Welcome to Chat App',
                      style: TextStyle(
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0.wp),
                    Text(
                      'Signup to continue',
                      style: TextStyle(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 5.0.wp),
                    TextFormField(
                      controller: controller.nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Name',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0.wp),
                    TextFormField(
                      controller: controller.emailController,
                      validator: (value) {
                        return controller.validateEmail(value!);
                      },
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0.wp),
                    TextFormField(
                      controller: controller.passwordController,
                      validator: (value) {
                        return controller.validatePassword(value!);
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
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
                        controller.signup();
                        // log(controller.emailController.text);
                        // controller.signup();
                      },
                      child: Text(
                        'Signup',
                        style: TextStyle(
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0.wp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            fontSize: 10.0.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.emailController.clear();
                            controller.passwordController.clear();
                            controller.nameController.clear();
                            Get.off(() => const LoginView());
                          },
                          child: Text(
                            'Login',
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
      ),
    );
  }
}
