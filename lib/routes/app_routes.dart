// ignore_for_file: constant_identifier_names

abstract class Routes {
  Routes._();
  static const HOME = Paths.home;
  static const LOGIN = Paths.login;
  static const SIGNUP = Paths.signup;
  static const SPLASH = Paths.splash;
}

abstract class Paths {
  Paths._();
  static const home = '/home';
  static const login = '/login';
  static const splash = '/splash';
  static const signup = '/signup';
}
