import 'package:api_test/components/error.dart';
import 'package:flutter/material.dart';

void pushError(context, e){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => ErrorPage(
          error: e.toString(),
        )
    ));
}