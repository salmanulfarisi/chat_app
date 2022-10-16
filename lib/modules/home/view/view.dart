import 'package:chat_app/modules/login/view/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homeview extends StatelessWidget {
  const Homeview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.offAll(() => const LoginView());
            },
            child: const Text('Logout')),
      ),
    );
  }
}
