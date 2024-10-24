import 'package:flutter/material.dart';
import 'package:paps/screens/home_screen.dart';
import 'package:paps/screens/input_screen.dart';
import 'package:paps/screens/list_screen.dart';
import 'package:paps/screens/edit_screen.dart';

void main() {
  runApp(InventoryApp());
}

class InventoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/input': (context) => InputScreen(),
        '/list': (context) => ListScreen(),
      },
    );
  }
}
