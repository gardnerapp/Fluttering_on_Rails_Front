import 'package:api_test/models/item.dart';
import 'package:flutter/material.dart';

class Destroy extends StatelessWidget {
  final Item item;

  const Destroy({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Destroy Item"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(onPressed: (){},
            child: Text("Destroy", style: TextStyle(
              fontSize: 18.0
            ),),
              color: Colors.red,
            ),
            RaisedButton(onPressed: (){
              Navigator.pushNamed(context, '/');
            },
              child: Text("Cancel", style: TextStyle(
                  fontSize: 18.0
              ),),
              color: Colors.blue,
            )
          ],
        ),
      )
    );
  }
}
