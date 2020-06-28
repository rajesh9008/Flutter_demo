import 'package:flutter/material.dart';
import 'package:flutterappdemo/providers/base_provider.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';

class BaseView<T extends BaseRepoProvider> extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const BaseView({this.builder, this.onModelReady});

  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Future<dynamic> Function(T) onModelReady;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseRepoProvider> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: (context) => model,
        child: Consumer<T>(builder: widget.builder));
  }
}
