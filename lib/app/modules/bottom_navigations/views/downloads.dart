import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DownloadsView extends StatelessWidget {
  const DownloadsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
    child: Container(
      height: 100,
      width: 100,
      color: Colors.amber,
      child: const Text("Downloads"),
    ),
      ),

    );
  }
}