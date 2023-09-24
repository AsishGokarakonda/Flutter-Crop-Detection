import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PestHome extends StatefulWidget {
  const PestHome({Key? key}) : super(key: key);

  @override
  State<PestHome> createState() => _PestHomeState();
}

class _PestHomeState extends State<PestHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Pest Management'.tr,
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PestHomeButtons(
                  title: 'Detect Disease',
                  route: '/diseasecheckcrop',
                  icon: Icons.pest_control,
                  color: Colors.red[300],
                ),
                PestHomeButtons(
                  route: '/yourcrops',
                  img: 'assets/home/plantimg.png',
                  title: 'Your Crops',
                  color: Colors.green[300],
                ),
              ],
            )
          ]),
        )));
  }
}

class PestHomeButtons extends StatelessWidget {
  const PestHomeButtons({
    super.key,
    this.route,
    this.img,
    required this.title,
    this.icon,
    this.color,
  });
  final route;
  final img;
  final IconData? icon;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(20)),
              child: // if icon is not null then show icon else show image
                  icon != null
                      ? Icon(
                          icon,
                          color: Colors.black,
                          size: 70,
                        )
                      : Image.asset(img),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title.tr,
              style: TextStyle(color: color),
            )
          ],
        ));
  }
}
