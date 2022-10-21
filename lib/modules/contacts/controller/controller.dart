import 'package:chat_app/data/model/users/users_model.dart';
import 'package:chat_app/modules/home/service/getuser_service.dart';
import 'package:get/get.dart';

class ContactsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllUser();
  }

  // variables
  List<UsersModel> allUser = [];
  var isLoading = false.obs;

  // function to fetch all users
  Future<List<UsersModel>> getAllUser() async {
    isLoading(true);
    allUser = await GetAllUser().getUsers();
    isLoading(false);
    return allUser;
  }

  // isLoading = true.obs;

  // List<UsersModel?> user = await GetAllUser().getUsers();
  // if (user.isEmpty) {
  //   Get.snackbar('title', 'Please check your internet connection !');
  //   _isLoadingFalse();
  //   return [];
  // } else {
  //   allUser.clear();
  //   allUser.addAll(user.map((e) => e!));
  //   _isLoadingFalse();
  //   return allUser;
  // }

  // function to make loading false
  // void _isLoadingFalse() {
  //   isLoading = false.obs;
  // }
}
