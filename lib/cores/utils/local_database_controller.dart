import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class LocalDatabaseController extends GetxController {
  

  // final Rx<UserDetailsModel> user =
  //     UserDetailsModel(email: '', fullName: '', phoneNumber: '', uid: '').obs;

  // bool get hasUserData => user.value.email != '';

  // void listenerForUserDetails() async {
  //   user.value = await localDatabaseRepo.getUserDataFromLocalDB() ??
  //       UserDetailsModel(email: '', fullName: '', phoneNumber: '', uid: '');

  //   LocalDatabaseRepo.box.listenKey(LocalDatabaseRepo.userDataBoxName, (value) {
  //     log('========== listening for user data ==========');
  //     log(' $value ');
  //     log('========== listening for user data ==========');

  //     if (value == null) {
  //       user.value =
  //           UserDetailsModel(email: '', fullName: '', phoneNumber: '', uid: '');
  //       return;
  //     }

  //     final Map<String, dynamic>? userDataMap = LocalDatabaseRepo.box
  //         .read(LocalDatabaseRepo.userDataBoxName) as Map<String, dynamic>?;

  //     final UserDetailsModel userDetailsModel =
  //         UserDetailsModel.fromMap(userDataMap ?? {});

  //     user.value = userDetailsModel;
  //   });
  // }

  // Future<void> saveUserDataToLocalDB(Map<String, dynamic> userdata) async {
  //   return localDatabaseRepo.saveUserDataToLocalDB(userdata);
  // }

  // Future<UserDetailsModel?> getUserDataFromLocalDB() async {
  //   return localDatabaseRepo.getUserDataFromLocalDB();
  // }

  // Future<void> clear() async {
  //   return localDatabaseRepo.clear();
  // }

  // @override
  // void onReady() {
  //   listenerForUserDetails();
  //   super.onReady();
  // }
}
