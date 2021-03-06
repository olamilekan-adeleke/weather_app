import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:weather_app/features/home/enum/controller_state_enum.dart';
import 'package:weather_app/features/home/service/weather_service.dart';
import 'package:weather_app/features/search/model/place_weather_model.dart';
import 'package:weather_app/features/search/views/screen/selected_location_screen.dart';

class SearchController extends GetxController {
  static final WeatherService _weatherService = Get.find<WeatherService>();
  final Rx<ControllerState> controllerState = ControllerState.init.obs;
  final RxString errorText = ''.obs;
  final RxString cityName = ''.obs;
  final RxDouble temp = 0.0.obs;
  Rx<PlaceWeatherModel>? weatherModel;
  final RxBool isInCelsius = true.obs;

  Future<void> search(String place) async {
    Get.to(() => const SelectedLocationScreen());

    getWeather(place);
  }

  Future<void> getWeather(String place) async {
    try {
      controllerState.value = ControllerState.busy;

      var result = await _weatherService
          .getCurrentWeatherByPlaceName('${place.toLowerCase()}, ng');

      log(result.bodyString);

      if (result.statusCode == 200 &&
          json.decode(result.bodyString)['cod'] == 200) {
        final Map<String, dynamic> data = json.decode(result.bodyString);

        // set cityName
        final String _cityName = '$place, NG';
        cityName.value = '$place, NG';

        // add city name to map
        data['cityName'] = _cityName;

        final Rx<PlaceWeatherModel> _weatherModel =
            PlaceWeatherModel.fromMap(data).obs;
        weatherModel = _weatherModel;

        // set isInCelsius to true
        isInCelsius.value = true;
        temp.value = _weatherModel.value.main?.temp ?? 0;
      } else {
        throw 'Opps, It looks like something went wrong \n City not found!';
      }

      controllerState.value = ControllerState.success;
    } on SocketException catch (e, s) {
      log(e.toString());
      log(s.toString());
      errorText.value =
          'Unable to connect to server. \nPlease check your internet connection and try again!';
      cityName.value = '$place, NG';
      controllerState.value = ControllerState.error;
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      errorText.value = e.toString();
      cityName.value = '$place, NG';
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
