import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowOfTwoButtons extends StatelessWidget {
  final String image1;
  final String title1;
  final String route1;
  final String title2;
  final String image2;
  final String route2;
  const RowOfTwoButtons({
    super.key, required this.image1, required this.title1, required this.route1, required this.title2, required this.image2, required this.route2
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, route1 );
              },
              child: Column(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      image1,
                      height: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(title1.tr,
                      style: TextStyle(color: Colors.black))
                ],
              )),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, route2);},
              child: Column(
                children: [
                  SizedBox(
                    width: 80,
                    height: 100,
                    child: Image.asset(
                      image2,
                      height: 80,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(title2,
                      style: TextStyle(color: Colors.black))
                ],
              )),
        ]
        );
  }
}
