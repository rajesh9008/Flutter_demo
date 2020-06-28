import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterappdemo/ui/pages/home_page_panel.dart';
import 'package:flutterappdemo/ui/widget/rounded_icon_button.dart';
import 'package:flutterappdemo/utils/colors.dart';
import 'package:flutterappdemo/utils/constants.dart';
import 'package:flutterappdemo/utils/margins_sizes.dart';
import 'package:flutterappdemo/utils/routes.dart';
import 'package:flutterappdemo/utils/spacing.dart';
import 'package:flutterappdemo/utils/utils.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
            child: SlidingUpPanel(
                maxHeight: getScreenSize(context, AppConstants.SLIDE_PANEL_MAX),
                minHeight: getScreenSize(context, AppConstants.SLIDE_PANEL_MIN),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppRadius.radiusCorner),
                  topRight: Radius.circular(AppRadius.radiusCorner),
                ),
                body: _getHomePage(context),
                panel: HomePagePanel())));
  }

  Container _getHomePage(BuildContext context) => Container(
      padding:
          const EdgeInsets.symmetric(horizontal: AppMargins.horizontalEdges),
      child: Column(
        children: <Widget>[
          UIHelper.verticalSpaceMedium(),
          Align(
              alignment: Alignment.topLeft,
              child: Icon(
                Icons.menu,
                color: Colors.white,
              )),
          UIHelper.verticalSpaceSmall(),
          _getBrowseHeader(context),
          const SizedBox(
            height: AppMargins.verticalHead4Margin,
          ),
          _getSubHeader(context),
          UIHelper.verticalSpaceLarge(),
          _getSearchTextField(context,
              (String value) => {log('message $value')}, 'Type keyword'),
          UIHelper.verticalSpaceLarge(),
          _getShortCuts(context),
        ],
      ),
    );

  Text _getSubHeader(BuildContext context) => Text(
      'Find podcast that suit your interest',
      style: Theme.of(context).textTheme.bodyText2.apply(
            color: AppColor.whiteTextColor,
          ),
    );

  Text _getBrowseHeader(BuildContext context) => Text('Browse',
        style: Theme.of(context).textTheme.headline3.copyWith(
            color: AppColor.whiteTextColor, fontWeight: FontWeight.bold));

  Row _getShortCuts(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RoundIconButton(
          icon: Icons.star,
          title: 'Popular',
          onPress: () {
            Navigator.pushNamed(context, Routes.recent);
          },
          textColor: AppColor.whiteTextColor,
        ),
        RoundIconButton(
          icon: Icons.call_made,
          title: 'Trending',
          onPress: () {
            Navigator.pushNamed(context, Routes.recent);
          },
          textColor: AppColor.whiteTextColor,
        ),
        RoundIconButton(
          icon: Icons.timer,
          title: 'Recent',
          onPress: () {
            Navigator.pushNamed(context, Routes.recent);
          },
          textColor: AppColor.whiteTextColor,
        ),
        RoundIconButton(
          icon: Icons.ac_unit,
          title: 'Magic',
          onPress: () {
            Navigator.pushNamed(context, Routes.recent);
          },
          textColor: AppColor.whiteTextColor,
        ),
      ],
    );

  TextField _getSearchTextField(
          BuildContext context, Function onChangedCallBack, String hint) =>
      TextField(
        onChanged: (value) {
          onChangedCallBack.call(value);
        },
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(AppRadius.radiusCircle),
            ),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(AppRadius.radiusCircle),
            ),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(AppRadius.radiusCircle),
            ),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          hintText: hint,
          filled: true,
          fillColor: AppColor.dividerColor,
          contentPadding: const EdgeInsets.fromLTRB(32, 20, 32, 20),
        ),
      );
}
