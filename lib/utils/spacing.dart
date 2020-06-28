import 'package:flutter/material.dart';

class UIHelper {
  // Vertical spacing constants. Adjust to your liking.
  static const double _VerticalSpaceSmall = 6;
  static const double _VerticalSpaceMedium = 16;
  static const double _VerticalSpaceLarge = 48;

  // Vertical spacing constants. Adjust to your liking.
  static const double _HorizontalSpaceSmall = 6;
  static const double _HorizontalSpaceMedium = 16;
  static const double _HorizontalSpaceLarge = 48;

  /// Returns a vertical space with height set to [_VerticalSpaceSmall]
  static Widget verticalSpaceSmall() => verticalSpace(_VerticalSpaceSmall);

  /// Returns a vertical space with height set to [_VerticalSpaceMedium]
  static Widget verticalSpaceMedium() => verticalSpace(_VerticalSpaceMedium);

  /// Returns a vertical space with height set to [_VerticalSpaceLarge]
  static Widget verticalSpaceLarge() => verticalSpace(_VerticalSpaceLarge);

  /// Returns a vertical space equal to the [height] supplied
  static Widget verticalSpace(double height) => Container(height: height);

  /// Returns a vertical space with height set to [_HorizontalSpaceSmall]
  static Widget horizontalSpaceSmall() => horizontalSpace(_HorizontalSpaceSmall);

  /// Returns a vertical space with height set to [_HorizontalSpaceMedium]
  static Widget horizontalSpaceMedium() => horizontalSpace(_HorizontalSpaceMedium);

  /// Returns a vertical space with height set to [_HorizontalSpaceLarge]
  static Widget horizontalSpaceLarge() => horizontalSpace(_HorizontalSpaceLarge);

  /// Returns a vertical space equal to the [width] supplied
  static Widget horizontalSpace(double width) => Container(width: width);
}
