import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/cores/components/custom_scaffold_widget.dart';
import 'package:weather_app/cores/utils/custom_sizer_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: sizerSp(20)),
          Row(children: <Widget>[
            Container(
              height: sizerSp(43),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(sizerSp(20)),
                color: const Color(0xff7E59Ed),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset('asset/location.svg'),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
