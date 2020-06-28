import 'package:flutter/material.dart';
import 'package:flutterappdemo/models/podcast.dart';
import 'package:flutterappdemo/ui/widget/rounded_icon_button.dart';
import 'package:flutterappdemo/utils/colors.dart';
import 'package:flutterappdemo/utils/margins_sizes.dart';
import 'package:flutterappdemo/utils/spacing.dart';

class DetailsPage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const DetailsPage(this.podCast);

  final PodCast podCast;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _getOverlapHeaderImage(context),
            UIHelper.verticalSpaceMedium(),
            _getHeader(context),
            _getDesc(context),
            _getAuthorInfo(),
            UIHelper.verticalSpaceMedium(),
            _getShortCuts(),
            UIHelper.verticalSpaceMedium(),
          ],
        ),
      ),
    );
  }

  ListTile _getHeader(BuildContext context) => ListTile(
      title: Text(podCast.name,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(fontWeight: FontWeight.bold)),
      trailing: RawMaterialButton(
        constraints: const BoxConstraints.tightFor(
          width: 58,
          height: 58,
        ),
        shape: const CircleBorder(),
        fillColor: Theme.of(context).accentColor,
        onPressed: () {},
        child: Icon(
          Icons.play_arrow,
          size: 24,
          color: Colors.white,
        ),
      ),
    );

  Stack _getOverlapHeaderImage(BuildContext context) => Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(podCast.imageUrl),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
              FocusScope.of(context).unfocus();
            },
          ),
        )
      ],
    );

  Container _getDesc(BuildContext context) => Container(
      padding: const EdgeInsets.all(AppMargins.horizontalEdges),
      alignment: Alignment.topLeft,
      child: Text(
        podCast.desc,
        style: Theme.of(context)
            .textTheme
            .bodyText2
            .apply(color: AppColor.secondaryTextColor),
      ),
    );

  ListTile _getAuthorInfo() => ListTile(
      title: Text(podCast.author),
      leading: CircleAvatar(
          radius: 28, backgroundImage: AssetImage(podCast.authorImageUrl)),
      subtitle: Text(podCast.followerCount),
    );

  Row _getShortCuts() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RoundIconButton(
          icon: Icons.star,
          title: 'Popular',
          onPress: () {},
        ),
        RoundIconButton(
          icon: Icons.trending_up,
          title: 'Trending',
          onPress: () {},
        ),
        RoundIconButton(
          icon: Icons.access_time,
          title: 'Recent',
          onPress: () {},
        ),
      ],
    );
}
