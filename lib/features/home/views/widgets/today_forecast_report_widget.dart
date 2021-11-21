import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/cores/components/custom_text_widget.dart';
import 'package:weather_app/cores/constants/color.dart';
import 'package:weather_app/cores/utils/custom_sizer_utils.dart';


class TodayForecastReportWidget extends StatelessWidget {
  const TodayForecastReportWidget({
    Key? key,
  }) : super(key: key);

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
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (_, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: sizerSp(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        textWidget(
                          '29 ',
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
                      '8 a.m ',
                      size: sizerSp(12),
                      fontWeight: FontWeight.w600,
                      color: kcTextColor,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
