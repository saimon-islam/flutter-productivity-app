import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Productivity App')),
        body: Center(child: Text('Welcome to Flutter Productivity App!')),
      ),
    );
  }
}