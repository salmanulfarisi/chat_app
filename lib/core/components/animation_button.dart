import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonController extends GetxController {
  static const kColorOut = Color(0xff2C2C2C);
  static const kColorOver = Color(0xff464646);

  final isLoading = false.obs;
  final isOver = false.obs;
  CrossFadeState fadeState = CrossFadeState.showFirst;
  double w = 130, h = 46, radius = 13;
  late Worker _worker;

  Color get backgroundColor => isOver() ? kColorOver : kColorOut;

  @override
  void onInit() {
    super.onInit();
    _worker =
        ever(isLoading, (flag) => flag != null ? _toLoading() : _toButton());
  }

  @override
  void onClose() {
    super.onClose();
    _worker.dispose();
  }

  void _toLoading() {
    w = 46;
    h = 46;
    radius = 23;
    fadeState = CrossFadeState.showSecond;
  }

  void _toButton() {
    w = 130;
    h = 46;
    radius = 13;
    fadeState = CrossFadeState.showFirst;
  }

  void toggleAnimation() => isLoading.toggle();
}

class ButtonLoader extends GetView<ButtonController> {
  final labelStyle = const TextStyle(
      color: Color(0xffFDFDFD),
      fontSize: 15,
      letterSpacing: .05,
      fontWeight: FontWeight.w700);

  const ButtonLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ButtonController());

    /// just to have a mouse over / out state.
    return MouseRegion(
      /// cursor: SystemMouseCursors.click, // only on dev channel
      onEnter: (e) => controller.isOver(true),
      onExit: (e) => controller.isOver(false),
      child: GestureDetector(
        onTap: controller.toggleAnimation,
        child: Obx(
          () {
            controller.isLoading();
            return AnimatedContainer(
              duration: .5.seconds,
              curve: Curves.easeOutExpo,
              width: controller.w,
              height: controller.h,
              decoration: BoxDecoration(
                color: controller.backgroundColor,
                borderRadius: BorderRadius.circular(controller.radius),
              ),
              alignment: Alignment.center,
              child: AnimatedCrossFade(
                alignment: Alignment.center,
                duration: .15.seconds,
                reverseDuration: .25.seconds,
                crossFadeState: controller.fadeState,
                firstCurve: Curves.easeIn,
                secondCurve: Curves.easeIn,
                firstChild: Text('Conectar', style: labelStyle, maxLines: 1),
                secondChild: const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                ),

                /// to keep the widgets centered.
                layoutBuilder:
                    (Widget top, Key topKey, Widget bottom, Key bottomKey) =>
                        Stack(children: [
                  Positioned.fill(key: bottomKey, child: Center(child: bottom)),
                  Positioned.fill(key: topKey, child: Center(child: top))
                ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
