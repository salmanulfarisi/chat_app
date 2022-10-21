import 'package:get_storage/get_storage.dart';

class NetworkHelper {
  static storeToken(String token) {
    GetStorage().write('token', token);
  }
}
