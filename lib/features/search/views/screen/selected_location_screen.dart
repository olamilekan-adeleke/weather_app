import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/cores/components/custom_scaffold_widget.dart';
import 'package:weather_app/cores/utils/custom_sizer_utils.dart';
import 'package:weather_app/features/search/controller/search_controller.dart';
import 'package:weather_app/features/search/views/widgets/search_header_widget.dart';

class SelectedLocationScreen extends StatelessWidget {
  const SelectedLocationScreen({Key? key}) : super(key: key);

  static final SearchController searchController = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: sizerHeight(90),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                SearchHeaderWidget(),
                // HomeWeatherDetailsWidget(),
                // HomeForecastButtonWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
