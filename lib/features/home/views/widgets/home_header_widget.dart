import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weather_app/cores/components/custom_text_widget.dart';
import 'package:weather_app/cores/components/shimmer_widget.dart';
import 'package:weather_app/cores/utils/custom_sizer_utils.dart';
import 'package:weather_app/features/home/controller/get_weather_controller.dart';
import 'package:weather_app/features/home/controller/home_controller.dart';
import 'package:weather_app/features/home/enum/controller_state_enum.dart';
import 'package:weather_app/features/search/controller/search_controller.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    Key? key,
  }) : super(key: key);

  static final HomeController homeController = Get.find<HomeController>();
  static final GetOneCallWeatherController getOneCallWeatherController =
      Get.find<GetOneCallWeatherController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
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
              PopupMenuButton(
                child: Obx(() {
                  if (getOneCallWeatherController.controllerState.value ==
                      ControllerState.busy) {
                    return shimmerRectangle(
                      height: sizerSp(10),
                      width: sizerSp(45),
                    );
                  }

                  return textWidget(
                    getOneCallWeatherController.weatherModel?.value.cityName ??
                        '',
                    size: sizerSp(12),
                    fontWeight: FontWeight.w400,
                  );
                }),
                itemBuilder: (_) {
                  return stateList.map((String e) {
                    return PopupMenuItem(
                      child: Text(e),
                      value: e,
                    );
                  }).toList();
                },
                onSelected: (val) {
                  log(val.toString());
                },
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => homeController.openNotifications(),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: sizerSp(10),
              vertical: sizerSp(10),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizerSp(10)),
              color: const Color(0xff7E59Ed),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'asset/bell.svg',
              height: sizerSp(20),
              width: sizerSp(20),
            ),
          ),
        ),
      ],
    );
  }
}
