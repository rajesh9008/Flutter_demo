import 'package:flutter/material.dart';
import 'package:flutterappdemo/models/podcast.dart';
import 'package:flutterappdemo/utils/colors.dart';
import 'package:flutterappdemo/utils/margins_sizes.dart';

class BigListItem extends StatelessWidget {
  const BigListItem({@required this.podCast, this.function, Key key}):super(key:key);

  static const SQUARE_SIDE = 110.0;
  static const RADIUS_IMG = 20.0;

  final PodCast podCast;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppMargins.horizontalEdges),
      child: GestureDetector(
        onTap: function.call,
        child: Row(
          children: <Widget>[_getImage(), _getNameDesc(context)],
        ),
      ),
    );
  }

  Container _getImage() => Container(
      height: SQUARE_SIDE,
      width: SQUARE_SIDE,
      child: SizedBox.expand(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(RADIUS_IMG)),
          child: Image.asset(
            podCast.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

  Padding _getNameDesc(BuildContext context) => Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            podCast.name,
            style: Theme.of(context).textTheme.headline6,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            podCast.author,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .apply(color: AppColor.secondaryTextColor),
          ),
        ],
      ),
    );
}
