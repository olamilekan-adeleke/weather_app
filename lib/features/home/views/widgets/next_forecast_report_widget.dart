import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/cores/components/custom_button.dart';
import 'package:weather_app/cores/components/custom_text_widget.dart';
import 'package:weather_app/cores/constants/color.dart';
import 'package:weather_app/cores/utils/custom_sizer_utils.dart';
import 'package:weather_app/cores/utils/time_ago.dart';
import 'package:weather_app/features/home/controller/get_weather_controller.dart';
import 'package:weather_app/features/home/enum/controller_state_enum.dart';
import 'package:weather_app/features/home/model/one_call_weather_moder.dart';

class NextForecastReportWidget extends StatelessWidget {
  const NextForecastReportWidget({
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textWidget(
              'Next forecast ',
              size: sizerSp(22),
              fontWeight: FontWeight.w700,
              color: kcTextColor,
            ),
            CustomButton(
              text: 'Seven Days',
              onTap: () {},
              color: const Color(0xff8862FC),
              height: sizerSp(36),
              width: sizerSp(100),
              textFontWeight: FontWeight.w600,
            ),
          ],
        ),
        SizedBox(height: sizerSp(10)),
        Container(
            width: double.infinity,
            height: sizerSp(240),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizerSp(11)),
              border: Border.all(color: kcTextColor.withOpacity(.5)),
            ),
            child: Obx(() {
              if (getOneCallWeatherController.controllerState.value !=
                  ControllerState.success) {
                return Container();
              }

              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (_, __) => const Divider(),
                itemCount: getOneCallWeatherController
                        .weatherModel!.value.daily?.length ??
                    0,
                itemBuilder: (_, int index) {
                  final Daily daily = getOneCallWeatherController
                      .weatherModel!.value.daily![index];

                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: sizerSp(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        textWidget(
                          formatDateWithoutDay(daily.dt ?? 0),
                          size: sizerSp(12),
                          fontWeight: FontWeight.w400,
                          color: kcTextColor,
                        ),
                        Image.asset(
                          'asset/${daily.weather?.first.icon}.png',
                          height: sizerSp(40),
                          width: sizerSp(40),
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              textWidget(
                                daily.temp!.day!.round().toString(),
                                size: sizerSp(16),
                                fontWeight: FontWeight.w400,
                                color: kcTextColor,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: textWidget(
                                  '℃',
                                  size: sizerSp(8),
                                  fontWeight: FontWeight.w400,
                                  color: kcTextColor,
                                ),
                              ),
                            ],
                          ),
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
