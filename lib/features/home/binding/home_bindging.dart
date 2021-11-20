import 'package:get/get.dart';
import 'package:weather_app/features/home/controller/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}
