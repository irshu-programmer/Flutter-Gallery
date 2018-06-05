import 'package:flutter/material.dart';
import 'package:wall_paper_app/wall_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Wall Paper",
      home: new WallScreen(),
    );
  }
}