import 'package:flutter/material.dart';
import 'package:weight_on_planet_x/ui/home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Weight On Planet X',
      theme: new ThemeData(
         primaryColorDark: Colors.blueGrey.shade700,
        primaryColor: Colors.blueGrey.shade500,
        accentColor: Colors.cyan.shade500,
        textSelectionHandleColor: Colors.cyan.shade500
      ),
      home: new HomePage(),
    );
  }
}

