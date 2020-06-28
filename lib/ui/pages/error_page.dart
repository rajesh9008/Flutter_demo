import 'package:flutter/material.dart';
import 'package:flutterappdemo/utils/margins_sizes.dart';

// ignore: use_key_in_widget_constructors
class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
                FocusScope.of(context).unfocus();
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(AppMargins.horizontalEdges),
            alignment: Alignment.center,
              child: Text(
            'Page is under development',
            style:
            Theme.of(context).textTheme.headline3,
          ))
        ],
      ),
    );
  }
}
