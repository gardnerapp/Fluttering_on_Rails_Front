import 'package:api_test/components/pop_button.dart';
import 'package:flutter/material.dart';

class IdSearch extends StatefulWidget {
  @override
  _IdSearchState createState() => _IdSearchState();
}

class _IdSearchState extends State<IdSearch> {

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Via ID"),
        leading: PopButton(context: context)
      ),
      body: Container(
        child: Form(
          key: _key,
          child: Column(

          ),
        ),
      ),
    );
  }
}

//TODO Add To GIT