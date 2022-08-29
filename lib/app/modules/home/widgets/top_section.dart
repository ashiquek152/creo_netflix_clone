import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopSection extends StatelessWidget {
  const TopSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(Get.height * 0.02),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/logo.ico", fit: BoxFit.cover, width: 35),
                const Icon(Icons.person, color: Colors.white, size: 35)
              ],
            ),
            SizedBox(height: Get.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Tv Shows",
                    style: TextStyle(
                        color: Colors.white, fontSize: Get.width * 0.04),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Movies",
                    style: TextStyle(
                        color: Colors.white, fontSize: Get.width * 0.04),
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Categories",
                        style: TextStyle(
                            color: Colors.white, fontSize: Get.width * 0.04),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
