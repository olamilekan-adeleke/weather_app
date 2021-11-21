import 'package:get/get.dart';
import 'package:weather_app/features/home/enum/controller_state_enum.dart';
import 'package:weather_app/features/home/model/one_call_weather_moder.dart';
import 'package:weather_app/features/notiification/service/local_database_service.dart';

class NotificationController extends GetxController {
  final Rx<ControllerState> controllerState = ControllerState.init.obs;
  static final LocalDatabaseService localDatabaseService =
      LocalDatabaseService();
  final RxList<WeatherModel> notifications = <WeatherModel>[].obs;

  Future<void> getNotifications() async {
    final List<Map<String, dynamic>> data =
        await localDatabaseService.getNotificationData();

    notifications.value = data.map((e) => WeatherModel.fromMap(e)).toList();
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
