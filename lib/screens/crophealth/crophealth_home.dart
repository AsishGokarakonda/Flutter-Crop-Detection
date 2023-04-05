import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:crop_recommend/utils/api.dart';

import '../../utils/routes.dart'; 
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CropHealthHome extends StatefulWidget {
  const CropHealthHome({super.key});

  @override
  State<CropHealthHome> createState() => _CropHealthHomeState();
}

class _CropHealthHomeState extends State<CropHealthHome> {
  void getvarshere() async {
    print("getting all vars home");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> temp= prefs.getStringList("spSelectedcrops") ?? CropHealthselection.selectedcrops;
    CropHealthselection.selectedcrops=temp;

    String? encodedMap = prefs.getString('spCropsbool');
    Map<String, dynamic> decodedMap = json.decode(encodedMap!);
    print(decodedMap);

    CropHealthselection.cropsbool= decodedMap.map((key, value) => MapEntry(key,value));

    // String? encodedMap2 = prefs.getString('spDayaftersowing');
    // Map<String, int> decodedMap2 = json.decode(encodedMap2!);
    // CropHealthselection.dayaftersowing=decodedMap2;
  }
  @override
  void initState() {
    print("crophome");
    getvarshere();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("sajdlfk");
    return ChoosingCrops(context);
  }

  // ignore: non_constant_identifier_names
  Scaffold ChoosingCrops(BuildContext context) {
    return Scaffold(
    appBar: // make background transparent
        AppBar(
      // back button color
      iconTheme: const IconThemeData(color: Colors.black),
      //increase the height of the appbar
      toolbarHeight: 110,
      // give border color to the appbar
      backgroundColor: Colors.transparent,
      elevation: 0,
      // center title
      centerTitle: true,
      // caption below title

      title: Column(children:  [
        SizedBox(
          height: 10,
        ),
        Text(
          'Select Your Crop'.tr,
          style: TextStyle(color: Colors.green, fontSize: 20),
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          'Select a crop so that we can help you'.tr,
          style: TextStyle(color: Colors.black54, fontSize: 13),
        ),
      ]),
    ),
    // if the user has not selected any crop then show the below body. Else show the selected crops
    // body: CropHealthselection.selectedcrops.length == 0
    //     ? const CropHealthBody()
    //     : const SelectedCropBody());


    body: SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Row(
            // space between the two buttons
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (CropHealthselection.cropsbool['Cotton'] == false) {
                      CropHealthselection.cropsbool['Cotton'] = true;
                      CropHealthselection.selectedcrops.add('Cotton');
                    } else {
                      CropHealthselection.cropsbool['Cotton'] = false;
                      CropHealthselection.selectedcrops.remove('Cotton');
                    }
                  });
                },
                child: Column(
                  children: [
                    // show checkbox icon if the crops bool value is true

                    // ( CropHealthselection.cropsbool['Cotton']! ? Icon(Icons.check_circle, color: Colors.green,  ) : Container( height:  , )),
                    SizedBox(
                        width: 100,
                        height: 10,
                        child: CropHealthselection.cropsbool['Cotton']!
                            ? Container(
                                // align the icon to the right of the container
                                alignment: Alignment.centerRight,
                                child: const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                              )
                            : Container()),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        'assets/crophealth/Cotton.png',
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Cotton'.tr,
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (CropHealthselection.cropsbool['Banana'] == false) {
                      CropHealthselection.cropsbool['Banana'] = true;
                      CropHealthselection.selectedcrops.add('Banana');
                    } else {
                      CropHealthselection.cropsbool['Banana'] = false;
                      CropHealthselection.selectedcrops.remove('Banana');
                    }
                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                        width: 100,
                        height: 10,
                        child: CropHealthselection.cropsbool['Banana']!
                            ? Container(
                                // align the icon to the right of the container
                                alignment: Alignment.centerRight,
                                child: const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                              )
                            : Container()),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        'assets/crophealth/Banana.png',
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Banana'.tr,
                        style: TextStyle(color: Colors.black))
                  ],
                ),
              ),
            ]),
        const SizedBox(
          height: 15,
        ),
        Row(
            // space between the two buttons
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // create a rounded button and keep a image inside it and on press of that

              GestureDetector(
                onTap: () {
                  setState(() {
                    if (CropHealthselection.cropsbool['Sugarcane'] == false) {
                      CropHealthselection.cropsbool['Sugarcane'] = true;
                      CropHealthselection.selectedcrops.add('Sugarcane');
                    } else {
                      CropHealthselection.cropsbool['Sugarcane'] = false;
                      CropHealthselection.selectedcrops.remove('Sugarcane');
                    }
                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                        width: 100,
                        height: 10,
                        child: CropHealthselection.cropsbool['Sugarcane']!
                            ? Container(
                                // align the icon to the right of the container
                                alignment: Alignment.centerRight,
                                child: const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                              )
                            : Container()),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        'assets/crophealth/Sugarcane.png',
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Sugarcane'.tr,
                        style: TextStyle(color: Colors.black))
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (CropHealthselection.cropsbool['Tomato'] == false) {
                      CropHealthselection.cropsbool['Tomato'] = true;
                      CropHealthselection.selectedcrops.add('Tomato');
                    } else {
                      CropHealthselection.cropsbool['Tomato'] = false;
                      CropHealthselection.selectedcrops.remove('Tomato');
                    }
                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                        width: 100,
                        height: 10,
                        child: CropHealthselection.cropsbool['Tomato']!
                            ? Container(
                                // align the icon to the right of the container
                                alignment: Alignment.centerRight,
                                child: const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                              )
                            : Container()),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        'assets/crophealth/Tomato.png',
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Tomato'.tr,
                        style: TextStyle(color: Colors.black))
                  ],
                ),
              ),
            ]),
        const SizedBox(
          height: 15,
        ),
        Row(
            // space between the two buttons
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // create a rounded button and keep a image inside it and on press of that
// wrap this in a gesture detector and on tap of this button navigate to the next page

              GestureDetector(
                onTap: () {
                  setState(() {
                    if (CropHealthselection.cropsbool['Wheat'] == false) {
                      CropHealthselection.cropsbool['Wheat'] = true;
                      CropHealthselection.selectedcrops.add('Wheat');
                    } else {
                      CropHealthselection.cropsbool['Wheat'] = false;
                      CropHealthselection.selectedcrops.remove('Wheat');
                    }
                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                        width: 100,
                        height: 10,
                        child: CropHealthselection.cropsbool['Wheat']!
                            ? Container(
                                // align the icon to the right of the container
                                alignment: Alignment.centerRight,
                                child: const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                              )
                            : Container()),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        'assets/crophealth/Wheat.png',
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Wheat'.tr,
                        style: TextStyle(color: Colors.black))
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (CropHealthselection.cropsbool['Potato'] == false) {
                      CropHealthselection.cropsbool['Potato'] = true;
                      CropHealthselection.selectedcrops.add('Potato');
                      print(CropHealthselection.selectedcrops);
                      // how to add the selected crops to the list of type List
                    } else {
                      CropHealthselection.cropsbool['Potato'] = false;
                      CropHealthselection.selectedcrops.remove('Potato');
                    }
                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                        width: 100,
                        height: 10,
                        child: CropHealthselection.cropsbool['Potato']!
                            ? Container(
                                // align the icon to the right of the container
                                alignment: Alignment.centerRight,
                                child: const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                              )
                            : Container()),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        'assets/crophealth/Potato.png',
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Potato'.tr,
                        style: TextStyle(color: Colors.black))
                  ],
                ),
              ),
            ]),

        const SizedBox(
          height: 30,
        ),

        // create a rounded button for selecting the crops

        TextButton(
          onPressed: () async {
            // set shared preferences for the selected crops
            SharedPreferences prefs = await SharedPreferences.getInstance();
            print(CropHealthselection.selectedcrops);
            prefs.setStringList('spSelectedcrops', CropHealthselection.selectedcrops);
            String encodedMap = json.encode(CropHealthselection.cropsbool);
            prefs.setString('spCropsbool', encodedMap);
            print("sp");
            print(prefs.getStringList('spSelectedcrops'));
            print(prefs.getString('spCropsbool'));
            print("spend");
            // show a dialog box which will show the selected crops
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      // show like this selected these many number of crops
                      'Selected Crops'.tr ,
                      textAlign: TextAlign.center,
                    ),
                    content: // show all these crops with comma separated

                    Text(
                      // change the language of the selected crops using .tr
                      CropHealthselection.cropsbool.keys.where((k) => CropHealthselection.cropsbool[k] == true).toList().join(', ')
                      // CropHealthselection.cropsbool.keys.where((k) => CropHealthselection.cropsbool[k] == true).toList().join(', ')
                      ,textAlign: TextAlign.center,style: const TextStyle(color: Colors.black54,),
                    ),

                    actions: [
                      TextButton(
                        onPressed: () {
                          //  Navigator.pushNamedAndRemoveUntil(context,MyRoutes.CropHealth, (route) => false);
                          // remove all the routes from the stack and add /home to the stack
                          Navigator.pushNamedAndRemoveUntil(context, MyRoutes.newrootRoute, (route) => false);
                          // remove /selectavailablecrops from the stack
                          // Navigator.popUntil(context, ModalRoute.withName(MyRoutes.CropHealth));
                          // // now navigate to the next page
                         Navigator.pushNamed(context, MyRoutes.crophealth);
                        },
                        child: Text(
                          'Ok'.tr,
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  );
                });
          },
          child: Text(
            'Confirm'.tr,
            style: TextStyle(color: Colors.white),
          ),
          style: TextButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
        )
      ]),
    )
    );
  }

  // Scaffold CropHealthHome(BuildContext context) {
  //   return Scaffold(
  //   appBar: AppBar(
  //     title: const Text('Selected Crops'),
  //   ),
  //   body: Center(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         const Text(
  //           'You have no selected crops',
  //         ),
  //         const SizedBox(height: 20),
  //         ElevatedButton(
  //           onPressed: () {
  //             Navigator.pushNamed(context, '/CropHealth');
  //           },
  //           child: const Text('Select Crops'),
  //         ),
  //       ],
  //     ),
  //   ),
  // );
  // }
}