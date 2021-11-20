import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weather_app/cores/components/custom_text_widget.dart';
import 'package:weather_app/cores/utils/custom_sizer_utils.dart';
import 'package:weather_app/features/home/controller/home_controller.dart';

class HomeForecastButtonWidget extends StatelessWidget {
  const HomeForecastButtonWidget({
    Key? key,
  }) : super(key: key);

  static final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => homeController.openBottomSheet(),
      child: Container(
        height: sizerSp(60),
        width: sizerSp(323),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(sizerSp(8)),
          color: const Color(0xff8862FC),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            textWidget(
              'Forecast report',
              size: sizerSp(18),
              fontWeight: FontWeight.w700,
            ),
            SizedBox(width: sizerSp(20)),
            SvgPicture.asset('asset/up.svg'),
          ],
        ),
      ),
    );
  }
}
