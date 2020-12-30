
import 'package:api_test/pages/show_item.dart';
import 'package:flutter/material.dart';
import 'package:api_test/models/item.dart';

// ignore: must_be_immutable
class Index extends StatelessWidget {
  final List<Item> items;

  const Index({Key key, this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rails"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int i) {
          return ListTile(
            title: Text(items[i].name),
            subtitle: Text(items[i].price.toString()),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowItem(
                            item: items[i],
                          )));
            },
          );
        },
      ),
    );
  }
}



//Add Destory  and update Buttons when viewing the item
//then tale to seperate screen
