import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:chat_app/core/value/config.dart';
import 'package:chat_app/data/helper/network_helper.dart';
import 'package:chat_app/data/model/login/login_model.dart';
import 'package:chat_app/data/model/login/login_response.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class LoginService {
  final getStorage = GetStorage();
  final dio = Dio(BaseOptions(baseUrl: Config.apiUrl));
  Future<LoginResponseModel?> loginUser(LoginModel model) async {
    try {
      Response response = await dio.post(Config.loginUrl, data: model.toJson());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        getStorage.write('id', response.data['_id']);
        NetworkHelper.storeToken(response.data['token']);
        log(response.data.toString());
        log(response.statusCode.toString());
        return LoginResponseModel.fromJson(response.data);
      } else {
        return LoginResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        log(e.response!.data.toString());
      } else {
        log(e.message);
      }
      log(e.toString());
    } on TimeoutException catch (e) {
      log(e.toString());
    } on SocketException catch (e) {
      log(e.toString());
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
