import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weather_app/cores/components/custom_text_widget.dart';
import 'package:weather_app/cores/constants/color.dart';
import 'package:weather_app/cores/utils/custom_sizer_utils.dart';
import 'package:weather_app/cores/utils/time_ago.dart';
import 'package:weather_app/features/home/controller/get_weather_controller.dart';
import 'package:weather_app/features/home/enum/controller_state_enum.dart';
import 'package:weather_app/features/home/model/one_call_weather_moder.dart';

class TodayForecastReportWidget extends StatelessWidget {
  const TodayForecastReportWidget({
    Key? key,
  }) : super(key: key);

  static final GetOneCallWeatherController getOneCallWeatherController =
      Get.find<GetOneCallWeatherController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        textWidget(
          'Today',
          size: sizerSp(22),
          fontWeight: FontWeight.w700,
          color: kcTextColor,
        ),
        SizedBox(height: sizerSp(10)),
        Container(
            width: double.infinity,
            height: sizerSp(106),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizerSp(11)),
              border: Border.all(color: kcTextColor.withOpacity(.5)),
            ),
            child: Obx(() {
              if (getOneCallWeatherController.controllerState.value !=
                  ControllerState.success) {
                return Container();
              }

              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: getOneCallWeatherController
                        .weatherModel!.value.hourly?.length ??
                    0,
                itemBuilder: (_, int index) {
                  final Current current = getOneCallWeatherController
                      .weatherModel!.value.hourly![index];

                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: sizerSp(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            textWidget(
                              current.temp!.round().toString(),
                              size: sizerSp(16),
                              fontWeight: FontWeight.w400,
                              color: kcTextColor,
                            ),
                            textWidget(
                              '℃',
                              size: sizerSp(8),
                              fontWeight: FontWeight.w400,
                              color: kcTextColor,
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          'asset/sunny.svg',
                          height: sizerSp(40),
                          width: sizerSp(40),
                        ),
                        textWidget(
                          formatTime(current.dt ?? 0),
                          size: sizerSp(12),
                          fontWeight: FontWeight.w600,
                          color: kcTextColor,
                        ),
                      ],
                    ),
                  );
                },
              );
            })),
      ],
    );
  }
}
