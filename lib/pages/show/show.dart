import 'package:api_test/models/item.dart';
import 'package:api_test/pages/update.dart';
import 'package:flutter/material.dart';

import '../destroy.dart';

class ShowItem extends StatelessWidget {
  final Item item;
//add patch put buttons
  const ShowItem({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Showing Item${item.id}"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text( "Name : ${item.name}", style: showText(),),
            SizedBox(height: 10,),
            Text("Price ${item.price}", style: showText(),),
            SizedBox(height: 10,),
            Text( "ID: ${item.id}", style: showText(),),
            SizedBox(height: 10,),
            Text( "Created At: ${item.created_at}", style: showText(),),
            SizedBox(height: 10,),
            Text( "Updated At: ${item.updated_at}", style: showText(),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Update()));
                  },
                  child: Text("Update"),
                  color: Colors.green[400],
                  splashColor: Colors.greenAccent[200],
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Destroy(item: item,)));
                  },
                  child: Text("Destroy"),
                  color: Colors.red[400],
                  splashColor: Colors.redAccent[200],
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
