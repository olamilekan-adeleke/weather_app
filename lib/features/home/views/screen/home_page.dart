import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/cores/components/custom_scaffold_widget.dart';
import 'package:weather_app/cores/components/shimmer_widget.dart';
import 'package:weather_app/cores/utils/custom_sizer_utils.dart';
import 'package:weather_app/features/home/controller/get_weather_controller.dart';
import 'package:weather_app/features/home/enum/controller_state_enum.dart';
import 'package:weather_app/features/home/views/widgets/home_forecast_button_widget.dart';
import 'package:weather_app/features/home/views/widgets/home_header_widget.dart';
import 'package:weather_app/features/home/views/widgets/home_weather_details_widget.dart';
import 'package:weather_app/features/map/map_widget.dart';

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
                children: <Widget>[
                  const HomeHeaderWidget(),
                  const HomeWeatherDetailsWidget(),
                  SizedBox(
                    height: sizerHeight(20),
                    child: Obx(() {
                      if (getOneCallWeatherController.controllerState.value ==
                          ControllerState.busy) {
                        return shimmerRectangle(
                          height: sizerSp(30),
                          width: double.infinity,
                        );
                      }

                      return MapWidget(
                        LatLng(
                          getOneCallWeatherController.weatherModel?.value.lat ??
                              0,
                          getOneCallWeatherController.weatherModel?.value.lon ??
                              0,
                        ),
                        placeName: getOneCallWeatherController
                            .weatherModel?.value.cityName,
                      );
                    }),
                  ),
                  const HomeForecastButtonWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
