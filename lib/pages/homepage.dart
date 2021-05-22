import 'package:flutter/material.dart';

// Creating a stateless object. Name is HomePage
class HomePage extends StatelessWidget {
  final int days = 30;

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalogue App")),
      body: Center(
        child: Container(
          child: Text("Welcome to $days Flutter"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
