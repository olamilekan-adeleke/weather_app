import 'package:flutter/material.dart';
import 'package:weather_app/cores/components/custom_scaffold_widget.dart';
import 'package:weather_app/features/home/views/widgets/home_forecast_button_widget.dart';
import 'package:weather_app/features/home/views/widgets/home_header_widget.dart';
import 'package:weather_app/features/home/views/widgets/home_weather_details_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          HomeHeaderWidget(),
          HomeWeatherDetailsWidget(),
          HomeForecastButtonWidget(),
        ],
      ),
    );
  }
}


