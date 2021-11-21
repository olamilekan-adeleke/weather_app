import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/cores/components/custom_button.dart';
import 'package:weather_app/cores/components/custom_text_widget.dart';
import 'package:weather_app/cores/constants/color.dart';
import 'package:weather_app/cores/utils/custom_sizer_utils.dart';


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
