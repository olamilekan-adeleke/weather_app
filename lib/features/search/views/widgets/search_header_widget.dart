import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weather_app/cores/components/custom_text_widget.dart';
import 'package:weather_app/cores/components/shimmer_widget.dart';
import 'package:weather_app/cores/constants/color.dart';
import 'package:weather_app/cores/utils/custom_sizer_utils.dart';
import 'package:weather_app/features/home/enum/controller_state_enum.dart';
import 'package:weather_app/features/search/controller/search_controller.dart';

class SearchHeaderWidget extends StatelessWidget {
  const SearchHeaderWidget({
    Key? key,
  }) : super(key: key);

  static final SearchController searchController = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Row(
        children: <Widget>[
          const Icon(Icons.arrow_back_ios_new, color: white),
          SizedBox(width: sizerSp(5)),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: sizerSp(15),
              vertical: sizerSp(10),
            ),
            // height: sizerSp(43),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizerSp(20)),
              color: const Color(0xff7E59Ed),
            ),
            child: Row(
              children: <Widget>[
                SvgPicture.asset('asset/location.svg'),
                SizedBox(width: sizerSp(8)),
                Obx(() {
                  if (searchController.controllerState.value ==
                      ControllerState.busy) {
                    return shimmerRectangle(
                      height: sizerSp(10),
                      width: sizerSp(45),
                    );
                  }

                  return textWidget(
                    searchController.weatherModel?.value.cityName ?? '',
                    size: sizerSp(12),
                    fontWeight: FontWeight.w400,
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
