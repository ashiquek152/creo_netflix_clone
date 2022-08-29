
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsSpanText extends StatelessWidget {
  const DetailsSpanText({
    Key? key,
    required this.data,
    required this.title,
  }) : super(key: key);

  final String title;
  final String? data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "$title : ",
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: data ?? "Not availabe",
                style: const TextStyle(fontSize: 16, color: Colors.amber),
              )
            ],
          ),
        ),
        SizedBox(height: Get.height * 0.01)
      ],
    );
  }
}
