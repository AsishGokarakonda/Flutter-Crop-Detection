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
                  // route: '/diseasecheckcrop',
                  popuptitle: 'Select Crop',
                  popupsubtitle: 'Select field crop if you want to detect disease of crop present in field or select new crop if you want to detect disease of new crop',
                  title1:'Crop present in field',
                  title2:'Crop not present in field',
                  route1: '/diseasecheckfield',
                  route2: '/diseasecheckcrop',
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
            ),
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
    this.popuptitle,
    this.popupsubtitle,
    this.title1,
    this.title2,
    this.route1,
    this.route2,
  });
  final route;
  final img;
  final IconData? icon;
  final String title;
  final Color? color;
  final String? popuptitle;
  final String? popupsubtitle;
  final String? title1;
  final String? title2;
  final String? route1;
  final String? route2;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          if (popuptitle != null) {
            
            // Get.snackbar('Coming Soon'.tr, 'This feature is coming soon'.tr,
            //     snackPosition: SnackPosition.BOTTOM,
            //     backgroundColor: Colors.white,
            //     colorText: Colors.black);
            // return;

            // show a dialog box with 2 buttons yes and no
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    title: Center(child: Text(popuptitle!.tr)),
                    content: Text(popupsubtitle!.tr),
                    actions: [
                      Column(
                        children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                            Navigator.pushNamed(context, route1!);
                          },
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(child: Text(title1!.tr, style: TextStyle(color: Colors.white),)),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                            Navigator.pushNamed(context, route2!);
                          },
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              margin: EdgeInsets.only(bottom: 10) ,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(child: Text(title2!.tr, style: TextStyle(color: Colors.white),)),
                            ),
                          ),
                        )
                      ],),
                    ],
                  );
                });
          }
          else{
          Navigator.pushNamed(context, route);
          }
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
