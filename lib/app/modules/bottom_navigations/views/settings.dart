import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
    child: Container(
      height: 100,
      width: 100,
      color: Colors.amber,
      child: const Text("Settings"),
    ),
      ),

    );
  }
}