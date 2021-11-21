import 'package:get/get.dart';
import 'package:weather_app/features/home/controller/get_weather_controller.dart';
import 'package:weather_app/features/home/controller/home_controller.dart';
import 'package:weather_app/features/home/service/reverse_geocoding_service.dart';
import 'package:weather_app/features/home/service/weather_service.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<WeatherService>(WeatherService.create());
    Get.put<ReverseGeocodingService>(ReverseGeocodingService());
    Get.put<GetOneCallWeatherController>(GetOneCallWeatherController());
  }

  
}
