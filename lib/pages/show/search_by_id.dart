import 'package:api_test/components/pop_button.dart';
import 'package:api_test/models/item.dart';
import 'package:api_test/pages/show/showi_item.dart';
import 'package:api_test/request/crud_services.dart';
import 'package:api_test/request/routing_helpers.dart';
import 'package:api_test/styles/input.dart';
import 'package:flutter/material.dart';

class IdSearch extends StatefulWidget {
  @override
  _IdSearchState createState() => _IdSearchState();
}

class _IdSearchState extends State<IdSearch> {
  CrudServices crud = CrudServices();
  final _key = GlobalKey<FormState>();
  int id;

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: textInputDecoration("ID"),
                onChanged: (val){
                  int num = int.parse(val);
                  setState(() {
                    id = num;
                  });
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter an ID';
                  } else if (int.tryParse(value).runtimeType != int) {
                    return 'Only enter numbers without Decimal Points ';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              RaisedButton(
                  child: Text("Search"),
                  onPressed: () async {
                    if (_key.currentState.validate()) {
                      try {
                        var item = await crud.findItem(id);
                        if (item == null) {
                          pushError(context,
                              "No Item Was Found! \n Try A Different ID");
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowItem(item: item)));
                        }
                      } on Exception catch (e) {
                        pushError(context, e);
                      }
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

//TODO Add To GIT