import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/features/home/enum/controller_state_enum.dart';

class SearchController extends GetxController {
  Future<void> searchForLocation(String username) async {
    // if (username.isEmpty || searchQuery.value == '') return;

    // try {
    //   controllerState.value = ControllerState.busy;

    //   controllerState.value = ControllerState.success;
    // } catch (e) {
    //   // errorAlertBadge(
    //   //   'Something went wrong while searching for users. \nPlease try again!',
    //   // );
    // }

    // searchQuery.value = '';
  }
}

List<String> stateList = [
  'Abia',
  'Adamawa',
  'Akwa Ibom',
  'Anambra',
  'Bauchi',
  'Bayelsa',
  'Benue',
  'Borno',
  'Cross River',
  'Delta',
  'Ebonyi',
  'Edo Benin',
  'Ekiti Ado',
  'Enugu',
  'Gombe',
  'Imo',
  'Jigawa',
  'Kaduna',
  'Kano',
  'Katsina',
  'Kebbi Birnin',
  'Kogi',
  'Kwara',
  'Lagos',
  'Nasarawa',
  'Niger',
  'Ogun',
  'Ondo',
  'Osun',
  'Oyo',
  'Plateau',
  'Rivers Port',
  'Sokoto',
  'Taraba',
  'Yobe',
  'Zamfara',
  'FCT',
  '',
];
