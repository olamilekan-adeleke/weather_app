import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:weather_app/features/enum/controller_state_enum.dart';
import 'package:weather_app/features/home/model/one_call_weather_moder.dart';
import 'package:weather_app/features/home/service/weather_service.dart';

class GetOneCallWeatherController extends GetxController {
  static final WeatherService _weatherService = Get.find<WeatherService>();
  final Rx<ControllerState> controllerState = ControllerState.init.obs;
  final RxString errorText = ''.obs;
  Rx<WeatherModel>? weatherModel;

  Future<void> getWeather() async {
    try {
      final LocationData? locationData = await getCurrentUserLocation();

      if (locationData == null ||
          locationData.latitude == null ||
          locationData.longitude == null) {
        // show snack bar
        return;
      }

      var result = await _weatherService.getOneCallWeather(
        locationData.latitude!,
        locationData.longitude!,
      );

      log(result.bodyString);

      if (result.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(result.bodyString);
        final Rx<WeatherModel> _weatherModel = WeatherModel.fromMap(data).obs;
        weatherModel = weatherModel;
      }
    } on SocketException catch (e, s) {
      log(e.toString());
      log(s.toString());
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
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

  @override
  void onReady() {
    getWeather();
    super.onReady();
  }
}
