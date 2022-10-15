import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/modules/splash/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: AnimatedTextKit(animatedTexts: [
          TypewriterAnimatedText(
            'Chat App',
            textStyle: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            speed: const Duration(milliseconds: 100),
          ),
        ]),
      ),
    );
  }
}
