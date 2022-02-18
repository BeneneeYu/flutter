import 'package:flutter/material.dart';
import 'package:messagelist/first_screen.dart';


void main()=>runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      theme: ThemeData.light(),
      home: FirstScreen(),
      
    );
  }
}