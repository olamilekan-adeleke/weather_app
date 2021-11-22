import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/cores/components/custom_scaffold_widget.dart';
import 'package:weather_app/cores/components/shimmer_widget.dart';
import 'package:weather_app/cores/utils/custom_sizer_utils.dart';
import 'package:weather_app/features/home/enum/controller_state_enum.dart';
import 'package:weather_app/features/map/map_widget.dart';
import 'package:weather_app/features/search/controller/search_controller.dart';
import 'package:weather_app/features/search/views/widgets/search_header_widget.dart';
import 'package:weather_app/features/search/views/widgets/search_weather_details_widget.dart';

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
              children: <Widget>[
                const SearchHeaderWidget(),
                const SearchWeatherDetailsWidget(),
                SizedBox(
                  height: sizerHeight(20),
                  child: Obx(() {
                    if (searchController.controllerState.value ==
                        ControllerState.busy) {
                      return shimmerRectangle(
                        height: sizerSp(30),
                        width: double.infinity,
                      );
                    }

                    return MapWidget(
                      LatLng(
                        searchController.weatherModel?.value.coord?.lat ?? 0,
                        searchController.weatherModel?.value.coord?.lon ?? 0,
                      ),
                      placeName: searchController.weatherModel?.value.cityName,
                    );
                  }),
                ),
                const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
