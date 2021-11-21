import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weather_app/cores/components/custom_text_widget.dart';
import 'package:weather_app/cores/constants/color.dart';
import 'package:weather_app/cores/utils/custom_sizer_utils.dart';
import 'package:weather_app/features/home/controller/home_controller.dart';
import 'package:weather_app/features/home/views/widgets/forecast_report_widget.dart';
import 'package:weather_app/features/notiification/views/widget/notifications_widgets.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  static final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizerSp(15)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
                Obx(
                  () {
                    return GestureDetector(
                      onTap: () => homeController.toggleView(),
                      child: Container(
                        child: textWidget(
                          homeController.bottomSheetHeading.value,
                          size: sizerSp(12),
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff8862FC),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(width: sizerSp(8)),
                SvgPicture.asset('asset/down.svg'),
              ],
            ),
          ),
          SizedBox(height: sizerSp(20)),
          Obx(() {
            if (homeController.bottomSheetHeading.value == 'Forecast report') {
              return const ForecastReportWidget();
            } else if (homeController.bottomSheetHeading.value ==
                'Your Notifications') {
              return const NotificationWidget();
            }

            return Container();
          }),
        ],
      ),
    );
  }
}
