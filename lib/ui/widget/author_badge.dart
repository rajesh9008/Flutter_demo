import 'package:flutter/material.dart';

class AuthorBadge extends StatelessWidget {
  const AuthorBadge(this.profileImagePath, this.authorName, {Key key})
      : super(key: key);

  static const RADIUS = 50.0;
  final String profileImagePath;
  final String authorName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: RADIUS,
          backgroundImage: AssetImage(profileImagePath),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 100),
          child: Text(
            authorName,
            maxLines: 1,
            style:
                Theme.of(context).textTheme.bodyText2.apply(color: Colors.grey),
          ),
        )
      ],
    );
  }
}
