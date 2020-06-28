import 'package:flutter/material.dart';
import 'package:flutterappdemo/locator.dart';
import 'package:flutterappdemo/utils/theme.dart';
import 'package:flutterappdemo/utils/utils.dart';

import 'ui/pages/home_page.dart';
import 'utils/routes.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setOrientationToPortrait();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      onGenerateRoute: Routes.generateRoute,
      onUnknownRoute: Routes.errorRoute,
      initialRoute: Routes.home,
      home: HomePage(),
    );
  }
}
