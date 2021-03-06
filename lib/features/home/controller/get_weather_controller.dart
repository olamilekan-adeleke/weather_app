import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:weather_app/features/home/enum/controller_state_enum.dart';

import 'package:weather_app/features/home/model/one_call_weather_moder.dart';
import 'package:weather_app/features/home/service/reverse_geocoding_service.dart';
import 'package:weather_app/features/home/service/weather_service.dart';
import 'package:weather_app/features/notiification/controller/notifcation_controller.dart';

class GetOneCallWeatherController extends GetxController {
  static final WeatherService _weatherService = Get.find<WeatherService>();
  static final ReverseGeocodingService _reverseGeocodingService =
      Get.find<ReverseGeocodingService>();
  static final NotificationController notificationController =
      Get.find<NotificationController>();
  final Rx<ControllerState> controllerState = ControllerState.busy.obs;
  final RxString errorText = ''.obs;
  final RxDouble temp = 0.0.obs;
  Rx<WeatherModel>? weatherModel;
  final RxBool isInCelsius = true.obs;

  Future<void> getWeather() async {
    try {
      controllerState.value = ControllerState.busy;

      final LocationData? locationData = await getCurrentUserLocation();

      if (locationData == null ||
          locationData.latitude == null ||
          locationData.longitude == null) {
        // show snack bar
        controllerState.value = ControllerState.error;
        return;
      }

      var result = await _weatherService.getOneCallWeather(
        locationData.latitude!,
        locationData.longitude!,
      );

      // log(result.bodyString);

      if (result.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(result.bodyString);

        // get cityName
        final String cityName =
            await _reverseGeocodingService.getCityNameFromLatLng(
                  locationData.latitude!,
                  locationData.longitude!,
                ) ??
                '';

        // add city name to map
        data['cityName'] = cityName;

        final Rx<WeatherModel> _weatherModel = WeatherModel.fromMap(data).obs;
        weatherModel = _weatherModel;

        // set isInCelsius to true
        isInCelsius.value = true;
        temp.value = _weatherModel.value.current.temp ?? 0;

        // save notification to local DB
        await notificationController
            .saveNotifications(_weatherModel.value.toMapForLocalDB());
      }

      controllerState.value = ControllerState.success;
    } on SocketException catch (e, s) {
      log(e.toString());
      log(s.toString());
      errorText.value =
          'Unable to connect to server. \nPlease check your internet connection and try again!';
      controllerState.value = ControllerState.error;
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      errorText.value = e.toString();
      controllerState.value = ControllerState.error;
    }
  }

  Future<LocationData?> getCurrentUserLocation() async {
    final Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();

    return _locationData;
  }

  void celsiusToFahrenheit() {
    if (isInCelsius.value) {
      temp.value = (temp.value * 1.8) + 32;
      isInCelsius.value = false;
    } else {
      temp.value = (temp.value - 32) / 1.8;
      isInCelsius.value = true;
    }
  }

  @override
  void onReady() {
    getWeather();
    super.onReady();
  }
}
