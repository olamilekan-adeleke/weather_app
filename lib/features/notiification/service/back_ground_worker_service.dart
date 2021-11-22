import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:weather_app/features/home/controller/get_weather_controller.dart';
import 'package:weather_app/features/home/model/one_call_weather_moder.dart';
import 'package:workmanager/workmanager.dart';

class BackgroundWorkerService {
  static final GetOneCallWeatherController getOneCallWeatherController =
      GetOneCallWeatherController();
  static final FlutterLocalNotificationsPlugin flip =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    await Workmanager().initialize(_callbackDispatcher, isInDebugMode: true);

    // Periodic task registration
    Workmanager().registerPeriodicTask(
      "2",
      "simplePeriodicTask",
      // frequency: Duration(minutes: 15),
    );
  }

  static void _callbackDispatcher() {
    Workmanager().executeTask((task, inputData) async {

      setUpNotification();


      final WeatherModel? weather =
          await getOneCallWeatherController.getWeatherForBackgroundService();

      if (weather == null) return Future.error(true);

      final String message =
          'Its ${weather.current.temp?.round()} ℃, And the weather report is '
          'a ${weather.current.weather?.first.description} day here '
          'in ${weather.cityName}';

      await _showNotificationWithDefaultSound(message);
      return Future.value(true);
    });
  }

  static Future _showNotificationWithDefaultSound(String message) async {
    // Show a notification after every 15 minute with the first
    // appearance happening a minute after invoking the method
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'my_channel_ID',
      'my_channel_ID',
      importance: Importance.high,
      priority: Priority.high,
    );

    const IOSNotificationDetails iOSPlatformChannelSpecifics =
        IOSNotificationDetails();

    // initialize channel platform for both Android and iOS device.
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flip.show(
      0,
      'Kod-x Weather',
      message,
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  static void setUpNotification() {
    // app_icon needs to be a added as a drawable
    // resource to the Android head project.
    const AndroidInitializationSettings android =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const IOSInitializationSettings iOS = IOSInitializationSettings();

    // initialize settings for both Android and iOS device.
    const InitializationSettings settings = InitializationSettings(
      android: android,
      iOS: iOS,
    );

    flip.initialize(settings);
  }
}
