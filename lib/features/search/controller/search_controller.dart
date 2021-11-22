import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:weather_app/features/home/enum/controller_state_enum.dart';
import 'package:weather_app/features/home/model/one_call_weather_moder.dart';
import 'package:weather_app/features/home/service/weather_service.dart';
import 'package:weather_app/features/search/views/screen/selected_location_screen.dart';

class SearchController extends GetxController {
  static final WeatherService _weatherService = Get.find<WeatherService>();
  final Rx<ControllerState> controllerState = ControllerState.init.obs;
  final RxString errorText = ''.obs;
  final RxDouble temp = 0.0.obs;
  Rx<WeatherModel>? weatherModel;
  final RxBool isInCelsius = true.obs;

  Future<void> search(String place) async {
    Get.to(() => const SelectedLocationScreen());

    getWeather(place);
  }

  Future<void> getWeather(String place) async {
    try {
      controllerState.value = ControllerState.busy;

      var result =
          await _weatherService.getCurrentWeatherByPlaceName('$place, ng');

      // log(result.bodyString);

      if (result.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(result.bodyString);

        // set cityName
        final String cityName = place;

        // add city name to map
        data['cityName'] = cityName;

        final Rx<WeatherModel> _weatherModel = WeatherModel.fromMap(data).obs;
        weatherModel = _weatherModel;

        // set isInCelsius to true
        isInCelsius.value = true;
        temp.value = _weatherModel.value.current.temp ?? 0;
      }

      controllerState.value = ControllerState.success;
    } on SocketException catch (e, s) {
      log(e.toString());
      log(s.toString());
      errorText.value = e.toString();
      controllerState.value = ControllerState.error;
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      errorText.value = e.toString();
      controllerState.value = ControllerState.error;
    }
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
];
