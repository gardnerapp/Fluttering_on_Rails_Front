import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  final String message;
  final Color color;

  const SuccessPage({Key key, this.message, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Success !"),
        leading: IconButton(icon: Icon(Icons.home), onPressed: (){
          Navigator.pushNamed(context, '/');
        }),
      ),
      body: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
