import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/cores/constants/color.dart';

class CustomBottomModalService {
  static void showModal(Widget child, {bool isScrollControlled = true}) {
    Get.bottomSheet(
      child,
      isDismissible: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      enableDrag: false,
      backgroundColor: white,
      isScrollControlled: isScrollControlled,
    );
  }
}
