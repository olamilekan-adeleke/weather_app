import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/cores/components/custom_scaffold_widget.dart';
import 'package:weather_app/cores/components/custom_text_widget.dart';
import 'package:weather_app/cores/utils/custom_sizer_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: sizerSp(20)),
          const HomeHeaderWidget(),
           Container(
            padding: EdgeInsets.symmetric(
              horizontal: sizerSp(15),
              vertical: sizerSp(15),
            ),
            // height: sizerSp(43),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sizerSp(15)),
              color: const Color(0xff7E59Ed),
            ),
            child: Row(
              children: <Widget>[
                SvgPicture.asset('asset/location.svg'),
                SizedBox(width: sizerSp(8)),
                textWidget(
                  'Lagos, Nigeria',
                  size: sizerSp(12),
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    Key? key,
  }) : super(key: key);

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
              textWidget(
                'Lagos, Nigeria',
                size: sizerSp(12),
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
        Container(
          height: sizerSp(44),
          width: sizerSp(43),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(sizerSp(10)),
            color: const Color(0xff7E59Ed),
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'asset/bell.svg',
            height: sizerSp(26),
            width: sizerSp(21),
          ),
        ),
      ],
    );
  }
}
