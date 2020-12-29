import 'package:flutter/material.dart';

textInputDecoration(String label) {
  return InputDecoration(
      labelText: label,
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange, width: 3.0)));
}