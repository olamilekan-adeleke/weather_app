import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/cores/components/custom_scaffold_widget.dart';
import 'package:weather_app/cores/utils/custom_sizer_utils.dart';
import 'package:weather_app/features/home/controller/get_weather_controller.dart';
import 'package:weather_app/features/home/views/widgets/home_forecast_button_widget.dart';
import 'package:weather_app/features/home/views/widgets/home_header_widget.dart';
import 'package:weather_app/features/home/views/widgets/home_weather_details_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static final GetOneCallWeatherController getOneCallWeatherController =
      Get.find<GetOneCallWeatherController>();

  @override
  Widget build(BuildContext context) {
    return scaffold(
      body: RefreshIndicator(
        onRefresh: () async => await getOneCallWeatherController.getWeather(),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: sizerHeight(90),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  HomeHeaderWidget(),
                  HomeWeatherDetailsWidget(),
                  HomeForecastButtonWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
