
import 'dart:io';

import 'package:api_test/components/error.dart';
import 'package:api_test/components/navigator_button.dart';
import 'package:api_test/pages/create.dart';
import 'package:api_test/pages/index.dart';
import 'package:api_test/pages/show/search_by_id.dart';
import 'package:api_test/request/crud_services.dart';
import 'package:api_test/request/routing_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rails CRUD API',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/create': (context) => Create(),
        '/index': (context) => Index(),
        '/show': (context) => IdSearch(),
      },
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {

  CrudServices crud = CrudServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Corey\'s Corner"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          NavigatorTile(
            title: "Create",
            onPressed: () {
              Navigator.pushNamed(context, '/create');
            },
            icon: Icons.create,
          ),
          NavigatorTile(
            title: "Index",
            onPressed: () async {
              try {
                var items = await crud.requestIndex();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Index(
                          items: items,
                        )));
              } on SocketException catch (e) {
                // in routing helpers
                pushError(context, e);
              }
            },
            icon: Icons.list,
          ),
          NavigatorTile(
            title: "Show",
            onPressed: () {
              Navigator.pushNamed(context, '/show');
            },
            icon: Icons.library_books,
          ),
          NavigatorTile(
            title: "Post",
            onPressed: () {
              Navigator.pushNamed(context, '/create');
            },
            icon: Icons.mail,
          ),
          NavigatorTile(
            title: "Patch",
            onPressed: () {
              Navigator.pushNamed(context, '/create');
            },
            icon: Icons.update,
          ),
          NavigatorTile(
            title: "Destroy",
            onPressed: () {

            },
            icon: Icons.delete_forever,
          ),
        ],
      ),
    );
  }


}



