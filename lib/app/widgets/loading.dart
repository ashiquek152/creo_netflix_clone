import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        child: Column(
          children: const [
            Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 10),
            DefaultTextStyle(
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              child: Text(
                "Please wait...",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
