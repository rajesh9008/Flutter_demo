import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {@required this.icon,
      @required this.title,
      @required this.onPress,
      this.textColor,
      Key key})
      : super(key: key);

  final IconData icon;
  final String title;
  final Color textColor;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _getRoundedIcon(context),
        const SizedBox(
          height: 12,
        ),
        _getTitle(context),
      ],
    );
  }

  Text _getTitle(BuildContext context) => Text(
        title,
        style: Theme.of(context).textTheme.bodyText2.apply(color: textColor),
      );

  RawMaterialButton _getRoundedIcon(BuildContext context) => RawMaterialButton(
        onPressed: onPress,
        constraints: const BoxConstraints.tightFor(
          width: 58,
          height: 58,
        ),
        shape: const CircleBorder(),
        fillColor: Colors.white,
        child: Icon(
          icon,
          size: 24,
          color: Theme.of(context).accentColor,
        ),
      );
}
