import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void setOrientationToPortrait() => SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

double screenHeight(BuildContext context,
    {int dividedBy = 1, double decreasedBy = 0.0}) {
  assert(dividedBy != 0, "Don't divide by 0");
  return (MediaQuery.of(context).size.height - decreasedBy) / dividedBy;
}

double getScreenSize(BuildContext context, double percentage) => screenHeight(context) * percentage;
