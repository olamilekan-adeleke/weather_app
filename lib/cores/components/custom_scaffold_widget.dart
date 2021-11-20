import '../utils/custom_sizer_utils.dart';
import 'package:flutter/material.dart';

Widget scaffold({
  required body,
  appBar,
  usePadding = true,
  useVPadding = true,
}) {
  return SafeArea(
    child: Scaffold(
      appBar: appBar,
      backgroundColor: const Color(0xff7047EB),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: usePadding ? sizerSp(10.0) : 0,
          vertical: useVPadding ? sizerSp(15.0) : 0,
        ),
        child: body,
      ),
    ),
  );
}
