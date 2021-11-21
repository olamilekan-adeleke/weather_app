import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/color.dart';
import '../utils/custom_sizer_utils.dart';

class CustomShimmerWidget extends StatelessWidget {
  const CustomShimmerWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade50,
      child: child,
    );
  }
}

Widget shimmerRectangle({double? height, double? width}) {
  return Shimmer.fromColors(
    baseColor: Colors.white54,
    highlightColor: kcPrimaryColor, //kcPrimaryColor.withOpacity(.5),
    child: Container(
      height: height ?? sizerSp(40),
      width: width ?? double.infinity,
      decoration: BoxDecoration(color: Colors.grey.shade100),
    ),
  );
}

Widget shimmerRound({double? height, double? width}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade50,
    child: Container(
        height: height ?? sizerSp(40),
        width: width ?? sizerSp(40),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: kcGrey100,
        )),
  );
}
