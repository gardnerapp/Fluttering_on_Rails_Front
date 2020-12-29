import 'package:flutter/material.dart';

class PopButton extends StatelessWidget {
  final BuildContext context;

  const PopButton({Key key, this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }
}
