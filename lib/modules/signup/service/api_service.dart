import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chat_app/core/value/config.dart';
import 'package:chat_app/data/model/signup/signup_model.dart';
import 'package:chat_app/data/model/signup/signup_response_model.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class SignUpService {
  final getStorage = GetStorage();
  final dio = Dio(BaseOptions(baseUrl: Config.apiUrl));
  Future<SignupResponseModel?> signupUser(SignupModel model) async {
    try {
      final response = await dio.post(Config.registerUrl, data: model.toJson());
      log(response.data.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        getStorage.write('id', response.data['_id']);
        getStorage.write('token', response.data['token']);
        log(response.data.toString());
        log(response.statusCode.toString());
        return SignupResponseModel.fromJson(response.data);
      } else {
        return SignupResponseModel.fromJson(jsonDecode(response.data));
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
