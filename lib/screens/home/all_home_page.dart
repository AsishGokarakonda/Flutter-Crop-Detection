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
    return Scaffold(
        appBar: // make background transparent
            AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // center title
          centerTitle: true,
          // caption below title

          title: Column(children:  [
            const SizedBox(
              height: 10,
            ),
            Text(
              'Kisan Suvidha'.tr,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
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
              height: 10,
            ),
            Row(
                // space between the two buttons
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // create a rounded button and keep a image inside it and on press of that
                  TextButton(
                      onPressed: () {
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'assets/home/cropchoice.png',
                              height: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Crop Choice'.tr,
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      )),
                  TextButton(
                      onPressed: () {
                        // go to Profile page
                        Navigator.pushNamed(context, '/profile');
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'assets/home/dashboard.png',
                              height: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Your Dashboard'.tr,
                              style: TextStyle(color: Colors.black))
                        ],
                      )),
                ]),
            const SizedBox(
              height: 15,
            ),
            Row(
                // space between the two buttons
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // create a rounded button and keep a image inside it and on press of that
        
                  TextButton(
                      onPressed: () {
                        
                        // go to Crop Choice page
                        Navigator.pushNamed(context, '/crophealth');
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'assets/home/crophealth.png',
                              height: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Crop Health'.tr,
                              style: TextStyle(color: Colors.black))
                        ],
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'assets/home/weed.png',
                              height: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Weed Management'.tr,
                              style: TextStyle(color: Colors.black))
                        ],
                      )),
                ]),
            const SizedBox(
              height: 15,
            ),
            Row(
                // space between the two buttons
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // create a rounded button and keep a image inside it and on press of that
        
                  TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'assets/home/market.png',
                              height: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Market Choice'.tr,
                              style: TextStyle(color: Colors.black))
                        ],
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/pesthome');},
                      child: Column(
                        children: [
                          SizedBox(
                            width: 80,
                            height: 100,
                            child: Image.asset(
                              'assets/home/pest.png',
                              height: 80,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Pest Management'.tr,
                              style: TextStyle(color: Colors.black))
                        ],
                      )),
                ]),
          ]),
        ));
  }
}
