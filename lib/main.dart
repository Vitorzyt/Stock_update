import 'package:flutter/material.dart';
import 'price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color.fromARGB(255, 63, 3, 244),
          scaffoldBackgroundColor: Colors.black),
      home: PriceScreen(),
    );
  }
}
