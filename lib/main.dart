import 'package:flutter/material.dart';
import 'package:flutterpackntrvlapp/view/HomeScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: HomeScreen.id,
    routes: {HomeScreen.id: (context) => HomeScreen()},
  ));
}
