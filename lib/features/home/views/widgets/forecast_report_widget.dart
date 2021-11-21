import 'package:flutter/material.dart';
import 'package:weather_app/cores/utils/custom_sizer_utils.dart';
import 'package:weather_app/features/home/views/widgets/next_forecast_report_widget.dart';
import 'package:weather_app/features/home/views/widgets/today_forecast_report_widget.dart';

class ForecastReportWidget extends StatelessWidget {
  const ForecastReportWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const TodayForecastReportWidget(),
        SizedBox(height: sizerSp(20)),
        const NextForecastReportWidget(),
        SizedBox(height: sizerSp(15)),
      ],
    );
  }
}
