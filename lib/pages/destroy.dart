import 'package:api_test/components/success.dart';
import 'package:api_test/models/item.dart';
import 'package:api_test/request/crud_services.dart';
import 'package:api_test/request/routing_helpers.dart';
import 'package:flutter/material.dart';

class Destroy extends StatelessWidget {
  final Item item;

  const Destroy({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CrudServices crud = CrudServices();
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Destroy"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(item.name, style: TextStyle(fontSize: 25.0, color: Colors.black),),
            SizedBox(height: 50.0),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton.icon(
                  onPressed: () async {
                    try {
                      var req = await crud.destroyItem(item);
                          if (req.statusCode == 200) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SuccessPage(
                                          message:
                                              "Item Destroyed !",
                                      color: Colors.red,
                                        )));
                          } else {
                            pushError(
                                context, "Bad Request Couldn't Destroy Item");
                          }
                        } on Exception catch (e) {
                          pushError(context, e);
                        }
                      },
                      elevation: 16.0,
                      padding: EdgeInsets.all(10.0),
                  icon: Icon(Icons.delete_forever,
                      color: Colors.white70, size: 30.0),
                  label: Text(
                    "Destroy",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  color: Colors.red,
                  splashColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.redAccent)),
                ),

                RaisedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  elevation: 16.0,
                  padding: EdgeInsets.all(10.0),
                  splashColor: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.blueAccent)),
                  label: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  color: Colors.blue,
                  icon:
                      Icon(Icons.exit_to_app, color: Colors.white70, size: 30.0),
                )
              ],
            ),]
        ),
        ));
  }
}
