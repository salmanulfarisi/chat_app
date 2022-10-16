import 'package:chat_app/modules/home/bindings/bindings.dart';
import 'package:chat_app/modules/home/view/view.dart';
import 'package:chat_app/modules/login/bindings/bindings.dart';
import 'package:chat_app/modules/login/view/view.dart';
import 'package:chat_app/modules/signup/bindings/bindings.dart';
import 'package:chat_app/modules/signup/view/view.dart';
import 'package:chat_app/modules/splash/bindings/bindings.dart';
import 'package:chat_app/modules/splash/view/view.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const Homeview(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBindings(),
    ),
  ];
}
