import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weather_app/cores/components/custom_text_widget.dart';
import 'package:weather_app/cores/components/shimmer_widget.dart';
import 'package:weather_app/cores/utils/custom_sizer_utils.dart';
import 'package:weather_app/cores/utils/time_ago.dart';
import 'package:weather_app/features/home/enum/controller_state_enum.dart';
import 'package:weather_app/features/search/controller/search_controller.dart';

class SearchWeatherDetailsWidget extends StatelessWidget {
  const SearchWeatherDetailsWidget({
    Key? key,
  }) : super(key: key);

  static final SearchController searchController = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizerSp(321),
      width: sizerSp(348),
      padding: EdgeInsets.symmetric(
        horizontal: sizerSp(15),
        vertical: sizerSp(15),
      ),
      // height: sizerSp(43),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(sizerSp(15)),
        color: const Color(0xff7750EC),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Obx(() {
            if (searchController.controllerState.value ==
                ControllerState.busy) {
              return Padding(
                padding: EdgeInsets.all(sizerSp(15)),
                child: shimmerRectangle(
                  height: sizerSp(40),
                  width: sizerSp(150),
                ),
              );
            }

            log('${searchController.weatherModel?.value.dt}');

            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/${searchController.weatherModel?.value.weather?.first.icon}.png',
                  width: sizerSp(45),
                  height: sizerSp(48),
                ),
                SizedBox(width: sizerSp(8)),
                Column(
                  children: <Widget>[
                    textWidget(
                      'Today',
                      size: sizerSp(24),
                      fontWeight: FontWeight.w500,
                    ),
                    textWidget(
                      formatDate(
                        searchController.weatherModel?.value.dt ?? 0,
                      ), //'Mon, 26 Apr',
                      size: sizerSp(12),
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            );
          }),
          Obx(() {
            if (searchController.controllerState.value ==
                ControllerState.busy) {
              return Padding(
                padding: EdgeInsets.all(sizerSp(15)),
                child: shimmerRectangle(
                  height: sizerSp(130),
                  width: sizerSp(150),
                ),
              );
            }
            return GestureDetector(
              onTap: () => searchController.celsiusToFahrenheit(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  textWidget(
                    '${searchController.temp.value.round()}',
                    size: sizerSp(154),
                    fontWeight: FontWeight.w500,
                  ),
                  textWidget(
                    searchController.isInCelsius.value ? '℃' : '°F',
                    size: sizerSp(18),
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            );
          }),
          Obx(() {
            if (searchController.controllerState.value ==
                ControllerState.busy) {
              return Padding(
                padding: EdgeInsets.all(sizerSp(15)),
                child: shimmerRectangle(
                  height: sizerSp(10),
                  width: sizerSp(160),
                ),
              );
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: textWidget(
                    '${searchController.weatherModel?.value.cityName} ~ ',
                    size: sizerSp(16),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                textWidget(
                  formatTime(
                    searchController.weatherModel?.value.dt ?? 0,
                  ),
                  size: sizerSp(16),
                  fontWeight: FontWeight.w400,
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
