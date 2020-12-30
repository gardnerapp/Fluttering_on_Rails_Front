import 'package:api_test/models/item.dart';
import 'package:api_test/pages/update.dart';
import 'package:flutter/material.dart';

import 'destroy.dart';

class ShowItem extends StatelessWidget {
  final Item item;

  const ShowItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item ${item.id}"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Name : ${item.name}",
              style: showText(),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Price : ${item.price}",
              style: showText(),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "ID : ${item.id}",
              style: showText(),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Created At:\n ${item.created_at}",
              style: showText(),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text("Updated At:\n ${item.updated_at}",
                style: showText(), textAlign: TextAlign.center),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.sync, color: Colors.white70),
                  label: Text(
                    "PUT",
                    style: buttonText(),
                  ),
                  elevation: 16.0,
                  padding: EdgeInsets.all(10.0),
                  color: Colors.greenAccent,
                  splashColor: Colors.green[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.green)),
                ),
                RaisedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.attachment,
                      color: Colors.white70,
                      size: 30.0,
                    ),
                    elevation: 16.0,
                    padding: EdgeInsets.all(10.0),
                    label: Text(
                      "PATCH",
                      style: buttonText(),
                    ),
                    color: Colors.lightBlueAccent,
                    splashColor: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blueAccent))),
                RaisedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Destroy(item: item)));
                  },
                  elevation: 16.0,
                  padding: EdgeInsets.all(10.0),
                  icon: Icon(
                    Icons.delete_forever,
                    color: Colors.white,
                  ),
                  label: Text(
                    "DESTROY",
                    style: buttonText(),
                  ),
                  color: Colors.redAccent,
                  splashColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

TextStyle showText(){
  return TextStyle(
    fontSize: 20.0,);
}

TextStyle buttonText(){
  return TextStyle(
    color: Colors.white,
    fontSize: 15.0,);
}