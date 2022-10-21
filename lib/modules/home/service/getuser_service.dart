// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:chat_app/core/value/config.dart';
import 'package:chat_app/data/model/users/users_model.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class GetAllUser {
  final GetStorage getStorage = GetStorage();
  final dio = Dio(BaseOptions(baseUrl: Config.apiUrl, headers: {
    'Authorization': 'Bearer ${GetStorage().read('token')}',
  }));
  Future<List<UsersModel>> getUsers() async {
    try {
      // dio.options.headers = {
      //   'Authorization': 'Bearer ${GetStorage().read('token')}',
      // };
      Response response = await dio.get(Config.registerUrl);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final userList =
            (response.data as List).map((e) => UsersModel.fromJson(e)).toList();
        log(userList.toString());
        return userList;
      } else {
        return [];
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response!.data.toString());
      } else {
        print(e.message);
      }
      print(e.toString());
    } on TimeoutException catch (e) {
      print(e.toString());
    } on SocketException catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
    return [];
  }
}
