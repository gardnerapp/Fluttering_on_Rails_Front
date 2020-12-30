import 'package:api_test/components/navigator_button.dart';
import 'package:flutter/material.dart';

class SearchDirectory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body:  ListView(
        children: <Widget>[
          NavigatorTile(
            title: "Search By ID",
            onPressed: () {
              Navigator.pushNamed(context, '/search/id');
            },
            icon: Icons.code,
          ),
          NavigatorTile(
            title: "Search By Name",
            onPressed: () {
              Navigator.pushNamed(context, '/search/name');
            },
            icon: Icons.folder,
          ),
          NavigatorTile(
            title: "Search By Price",
            onPressed: () {
              Navigator.pushNamed(context, '/search/price');
            },
            icon: Icons.attach_money,
          ),
        ],
      ),
    );
  }
}
