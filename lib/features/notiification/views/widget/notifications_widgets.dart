import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weather_app/cores/components/custom_text_widget.dart';
import 'package:weather_app/cores/constants/color.dart';
import 'package:weather_app/cores/utils/custom_sizer_utils.dart';
import 'package:weather_app/features/notiification/controller/notifcation_controller.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  static final NotificationController notificationController =
      Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: sizerHeight(50),
          child: ListView.separated(
            separatorBuilder: (_, __) => const Divider(),
            physics: const BouncingScrollPhysics(),
            itemCount: 20,
            itemBuilder: (_, __) {
              return Row(
                children: [
                  SvgPicture.asset(
                    'asset/sunny.svg',
                    height: sizerSp(25),
                    width: sizerSp(25),
                  ),
                  SizedBox(width: sizerSp(10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      textWidget(
                        '10 minutes ago',
                        size: sizerSp(10),
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff737272),
                      ),
                      SizedBox(height: sizerSp(5)),
                      textWidget(
                        'Its a sunny day in your location',
                        size: sizerSp(14),
                        fontWeight: FontWeight.w400,
                        color: kcTextColor,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
