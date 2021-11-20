import 'package:flutter/material.dart';
import 'package:weather_app/cores/components/custom_scaffold_widget.dart';
import 'package:weather_app/cores/utils/custom_sizer_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scaffold(
      body: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Container(
              width: sizerSp(159),
              height: sizerSp(43),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(sizerSp(20)),
                color: const Color(0xff7E59Ed),
              ),
              child: Row(
                children: <Widget>[],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
