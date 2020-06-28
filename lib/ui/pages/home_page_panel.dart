import 'package:flutter/material.dart';
import 'package:flutterappdemo/providers/dashboard_provider.dart';
import 'package:flutterappdemo/ui/pages/base_page.dart';
import 'package:flutterappdemo/ui/widget/author_badge.dart';
import 'package:flutterappdemo/ui/widget/big_list_item.dart';
import 'package:flutterappdemo/utils/constants.dart';
import 'package:flutterappdemo/utils/margins_sizes.dart';
import 'package:flutterappdemo/utils/routes.dart';

// ignore: use_key_in_widget_constructors
class HomePagePanel extends StatelessWidget {
  final list = getDummyPodCasts();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppMargins.horizontalEdges),
      child: _getBody(context),
    );
  }

  Column _getBody(BuildContext context) {
    return Column(
      children: <Widget>[
        _getHeader(context),
        _getAnchor(context),
        BaseView<DashBoardRepoProvider>(
          onModelReady: (model) => model.loadData(),
          builder: (context, model, child) => !(model.isLoaded || model.loadingFailed)
              ? _getProgressBar()
              : Expanded(
                  child: ListView(children: <Widget>[
                    _getPodCastList(),
                    _getSubHeader(context),
                    _getAuthorList(),
                  ]),
                ),
        )
      ],
    );
  }

  SizedBox _getProgressBar() {
    return const SizedBox(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(strokeWidth: 5));
  }

  Padding _getSubHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48, bottom: 30),
      child: Text(
        'Top Authors',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  ListView _getPodCastList() => ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return BigListItem(
            podCast: list[index],
            function: () => {
              Navigator.pushNamed(context, Routes.details,
                  arguments: {AppConstants.KEY_DATA: list[index]})
            },
          );
        },
      );

  SizedBox _getAuthorList() => SizedBox(
        height: 150,
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(width: 20),
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return AuthorBadge(list[index].authorImageUrl, list[index].author);
          },
        ),
      );

  Padding _getAnchor(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: AppMargins.horizontalEdges),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: Theme.of(context).accentColor,
            ),
            height: 6,
            width: 40,
          ),
        ),
      );

  Padding _getHeader(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 20),
        child: Center(
          child: Text(
            'Handpicked',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      );
}
