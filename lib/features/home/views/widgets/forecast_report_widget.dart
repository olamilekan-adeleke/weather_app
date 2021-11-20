import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/cores/components/custom_button.dart';
import 'package:weather_app/cores/components/custom_text_widget.dart';
import 'package:weather_app/cores/constants/color.dart';
import 'package:weather_app/cores/utils/custom_sizer_utils.dart';

class ForecastReportWidget extends StatelessWidget {
  const ForecastReportWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizerSp(15)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: sizerSp(20)),
          SvgPicture.asset('asset/line.svg', color: kcTextColor),
          SizedBox(height: sizerSp(18)),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: sizerSp(15),
              vertical: sizerSp(10),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizerSp(20)),
              color: const Color(0xffF1EDFD),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                textWidget(
                  'Forecast report',
                  size: sizerSp(12),
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff8862FC),
                ),
                SizedBox(width: sizerSp(8)),
                SvgPicture.asset('asset/down.svg'),
              ],
            ),
          ),
          SizedBox(height: sizerSp(20)),
          const TodayForecastReportWidget(),
          SizedBox(height: sizerSp(20)),
          const NextForecastReportWidget(),
          SizedBox(height: sizerSp(15)),
        ],
      ),
    );
  }
}

class NextForecastReportWidget extends StatelessWidget {
  const NextForecastReportWidget({
    Key? key,
  }) : super(key: key);

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
              text: 'Five Days',
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
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: 20,
            itemBuilder: (_, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: sizerSp(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    textWidget(
                      'April 5',
                      size: sizerSp(12),
                      fontWeight: FontWeight.w400,
                      color: kcTextColor,
                    ),
                    SvgPicture.asset(
                      'asset/sunny.svg',
                      height: sizerSp(40),
                      width: sizerSp(40),
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          textWidget(
                            '28 ',
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
          ),
        ),
      ],
    );
  }
}

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
