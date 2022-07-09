import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/color_collection.dart';

void changeSystemStatusBarConfig({
  Color statusBarColor = AppColors.transparentColor,
  Brightness? statusIconBrightness = Brightness.dark,
}) =>
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusBarColor, // status bar color
      statusBarIconBrightness: statusIconBrightness,
    ));
