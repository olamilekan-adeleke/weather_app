import 'dart:developer';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/features/home/enum/controller_state_enum.dart';
import 'package:weather_app/features/home/model/one_call_weather_moder.dart';
import 'package:weather_app/features/notiification/service/local_database_service.dart';

class NotificationController extends GetxController {
  final Rx<ControllerState> controllerState = ControllerState.init.obs;
  static final LocalDatabaseService localDatabaseService =
      LocalDatabaseService();
  final RxList<WeatherModel> notifications = <WeatherModel>[].obs;

  Future<void> getNotifications() async {
    localDatabaseService.notificationDataStream().listen((BoxEvent event) {
      log(event.toString());
      final List<dynamic> data = List<dynamic>.from(event.value ?? []);

      List<Map<String, dynamic>> result =
          data.map((e) => Map<String, dynamic>.from(e)).toList();

      notifications.value = result.map((e) => WeatherModel.fromMap(e)).toList();
      log('${result.length} data save');
    });

    controllerState.value = ControllerState.success;
  }

  Future<void> saveNotifications(Map<String, dynamic> data) async {
    await localDatabaseService.saveNotificationData(data);
  }

  Future<void> init() async {
    controllerState.value = ControllerState.busy;
    await localDatabaseService.openNotificationsBox();
    getNotifications();
  }

  @override
  void onReady() {
    init();
    super.onReady();
  }
}
