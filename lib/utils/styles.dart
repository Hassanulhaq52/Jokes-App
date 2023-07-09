import 'package:flutter/material.dart';

class Styles {

  static const InputDecoration fieldDecoration = InputDecoration(
    contentPadding:
    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );

  static const BoxDecoration containerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  );

  static const authenticationFieldDecoration = InputDecoration(
    hintText: 'Enter a value',
    contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
    border: InputBorder.none,
    hintStyle: TextStyle(color: Colors.black45),
  );

  static const TextStyle apiDataStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textContainerStyle = TextStyle(

    fontSize: 17,
    fontWeight: FontWeight.bold,
    color: Colors.white,

  );

}