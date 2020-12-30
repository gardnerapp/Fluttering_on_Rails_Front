import 'package:api_test/components/pop_button.dart';
import 'package:api_test/request/crud_services.dart';
import 'package:flutter/material.dart';
import 'package:api_test/styles/input.dart';


class Create extends StatefulWidget {

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {

  final _formKey = GlobalKey<FormState>();
  String name;
  String price;

  CrudServices crud = CrudServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text('Create'), leading: PopButton(context: context)),
        body: Container(
            child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: textInputDecoration("Name"),
                        onChanged: (val){
                          setState(() {
                            name = val;
                          });
                        },
                        validator: (value){
                          if (value.isEmpty){
                            return 'Please enter an Item name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        decoration: textInputDecoration("Price"),
                        onChanged: (val){
                          setState(() {
                            price = val;
                          });
                        },
                        validator: (value){
                          if (value.isEmpty){
                            return 'Please enter an Item price';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      RaisedButton.icon(onPressed: () async {
                        if(_formKey.currentState.validate()){
                          await crud.createItem(name, price);
                          Navigator.pushNamed(context, '/');
                        }
                      },
                        elevation: 16.0,
                        padding: EdgeInsets.all(10.0),
                        icon: Icon(Icons.open_in_new, color: Colors.white70, size: 30.0,),
                        label: Text("Submit", style: TextStyle(color: Colors.white, fontSize: 20.0),),
                        splashColor: Colors.amber,
                        color: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.orange),
                        ),
                      )

                    ]))));
  }
}