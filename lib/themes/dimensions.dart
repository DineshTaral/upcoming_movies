import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final double deviceHeight = Device.height;
final double deviceWidth = Device.width;

const double paddingExtraSmall = 5.0;
const double paddingSmall = 8.0;
const double paddingMedium = 16.0;
const double paddingLarge = 20.0;
const double paddingExtraLarge = 24.0;

const smallVertSpace = SizedBox(
  height: paddingSmall,
);
const mediumVertSpace = SizedBox(
  height: paddingMedium,
);

const smallHorizontalSpace = SizedBox(
  width: paddingSmall,
);
const mediumHorizontalSpace = SizedBox(
  width: paddingMedium,
);

