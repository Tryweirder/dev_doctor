import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  @override
  final Size preferredSize;
  final List<Widget> actions;

  final PreferredSizeWidget bottom;

  MyAppBar({this.title, this.actions, Key key, this.bottom})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5.0,
      title: Text(title),
      bottom: bottom,
      actions: actions,
      //actions: [IconButton(icon: Icon(Icons.settings_outlined), onPressed: () {})],
      automaticallyImplyLeading: true,
    );
  }
}
