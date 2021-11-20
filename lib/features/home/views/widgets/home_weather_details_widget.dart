import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/cores/components/custom_text_widget.dart';
import 'package:weather_app/cores/utils/custom_sizer_utils.dart';


class HomeWeatherDetailsWidget extends StatelessWidget {
  const HomeWeatherDetailsWidget({
    Key? key,
  }) : super(key: key);

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'asset/sunny.svg',
                width: sizerSp(78),
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
                    'Mon, 26 Apr',
                    size: sizerSp(12),
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              textWidget(
                '28',
                size: sizerSp(154),
                fontWeight: FontWeight.w500,
              ),
              textWidget(
                '℃',
                size: sizerSp(18),
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              textWidget(
                'Lagos, Nigeria ~ ',
                size: sizerSp(16),
                fontWeight: FontWeight.w400,
              ),
              textWidget(
                '2:00 p.m',
                size: sizerSp(16),
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
