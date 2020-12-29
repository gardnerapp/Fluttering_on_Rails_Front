import 'package:api_test/models/item.dart';
import 'package:api_test/pages/update_pages/patch.dart';
import 'package:api_test/pages/update_pages/put.dart';
import 'package:flutter/material.dart';

class Update extends StatelessWidget {
  final Item item;

  const Update({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(
              child: Text("PUT Update"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Put(
                              item: item,
                            )));
              }),
          RaisedButton(
              child: Text("PATCH Update"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Patch(item: item)));
              }),
        ],
      ),
    );
  }
}
