import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/api.dart';

class AllHomePage extends StatefulWidget {
  const AllHomePage({Key? key}) : super(key: key);

  @override
  State<AllHomePage> createState() => _AllHomePageState();
}

class _AllHomePageState extends State<AllHomePage> {
    void getAllVars() async{
    print("getting in all home");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> temp= prefs.getStringList("spSelectedcrops") ?? [];
    print('hi');
    print(temp);
    CropHealthselection.selectedcrops=temp;

    String? encodedMap = prefs.getString('spCropsbool');
    Map<String, dynamic> decodedMap = json.decode(encodedMap!);
    print(decodedMap);

    CropHealthselection.cropsbool= decodedMap.map((key, value) => MapEntry(key,value));

    // Get.updateLocale(const Locale('kn', 'IN'));
    String lang = prefs.getString("language") ?? "en_US";
    Get.updateLocale(Locale(lang.split("_")[0], lang.split("_")[1]));
  }
  @override
  void initState() {
    getAllVars();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: // make background transparent
              AppBar(
                  shape: const Border(
    bottom: BorderSide(
      color: Colors.grey,
      width: 1.5
    )
  ),

            backgroundColor: Colors.transparent,
            centerTitle: true,
            toolbarHeight: 90 ,
    
            title: Column(children:  [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Kisaan Margadarshak'.tr,
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'A Smart App'.tr,
                style: TextStyle(color: Colors.black38, fontSize: 12),
              ),
            ]),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 15,
              ),

              RowOfTwoButtons(image1: 'assets/home/cropchoice.png', title1: 'Crop Choice', route1: '/', title2: 'Your Dashboard'.tr, image2: 'assets/home/dashboard.png', route2: '/profile'),
              
              const SizedBox(
                height: 15,
              ),

              RowOfTwoButtons(image1: 'assets/home/crophealth.png', title1: 'Crop Advisory'.tr, route1: '/crophealth', title2: 'Weed Management'.tr, image2: 'assets/home/weed.png', route2: '/'),
              
              const SizedBox(
                height: 15,
              ),

              RowOfTwoButtons(image1: 'assets/home/market.png', title1: 'Market Choice'.tr, route1: '/pricepredict', title2: 'Pest Management'.tr, image2: 'assets/home/pest.png', route2: '/pesthome'),

              const SizedBox(
                height: 15,
              ),

              RowOfTwoButtons( image1: 'assets/home/weather.png', title1: 'Weather Info'.tr, route1: '/searchweather', title2: 'Pest Management'.tr, image2: 'assets/home/pest.png', route2: '/pesthome',),
            ]),
          )),
    );
  }
}

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
