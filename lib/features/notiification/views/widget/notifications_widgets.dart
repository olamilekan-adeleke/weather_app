import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/cores/components/custom_text_widget.dart';
import 'package:weather_app/cores/constants/color.dart';
import 'package:weather_app/cores/utils/custom_sizer_utils.dart';
import 'package:weather_app/cores/utils/time_ago.dart';
import 'package:weather_app/features/home/model/one_call_weather_moder.dart';
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
            itemCount: notificationController.notifications.length,
            itemBuilder: (_, int index) {
              final WeatherModel notification =
                  notificationController.notifications[index];

              return Row(
                children: [
                  Image.asset(
                    'asset/${notification.current.weather?.first.icon}.png',
                    height: sizerSp(25),
                    width: sizerSp(25),
                  ),
                  SizedBox(width: sizerSp(10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      textWidget(
                        displayTimeAgo(notification.current.dt ?? 0),
                        size: sizerSp(10),
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff737272),
                      ),
                      SizedBox(height: sizerSp(5)),
                      SizedBox(
                        width: sizerWidth(78),
                        child: textWidget(
                          'Its ${notification.current.temp?.round()} ℃, And the weather report is a ${notification.current.weather?.first.description} day here in ${notification.cityName}',
                          size: sizerSp(13),
                          fontWeight: FontWeight.w200,
                          color: kcTextColor,
                        ),
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
