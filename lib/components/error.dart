
import 'package:flutter/material.dart';
class ErrorPage extends StatelessWidget {
  final String error;

  const ErrorPage({Key key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error"),
        leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Oops! An Error Occurred: \n", style: errorStyle(),),
            Text(error, style: errorStyle() ,)
          ],
        ),
      ),
    );
  }

  TextStyle errorStyle(){
    return TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold
    );
  }

}
