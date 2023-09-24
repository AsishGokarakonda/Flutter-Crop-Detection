import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:crop_recommend/utils/api.dart';
import 'package:crop_recommend/screens/crophealth/crophealth_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/routes.dart';
import 'package:get/get.dart';
class SelectedCropsHome extends StatefulWidget {
  const SelectedCropsHome({super.key});

  @override
  State<SelectedCropsHome> createState() => _SelectedCropsHomeState();
}

class _SelectedCropsHomeState extends State<SelectedCropsHome> {

  void getvars() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? encodedMap = prefs.getString('spCropsbool');
    Map<String, dynamic> decodedMap = json.decode(encodedMap!);
  }
  @override
  void initState() {
    getvars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("selected crops.dart");
    print(CropHealthselection.selectedcrops);
     return CropHealthselection.selectedcrops.isNotEmpty ? SelectedCropsHome(context): const CropHealthHome();
  }

  // ignore: non_constant_identifier_names
  Scaffold SelectedCropsHome(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // back button color
          iconTheme: const IconThemeData(color: Colors.black),
          //increase the height of the appbar
          toolbarHeight: 100,
          // give border color to the appbar
          backgroundColor: Colors.transparent,
          elevation: 0,
          // center title
          centerTitle: true,

          title: Column(children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'Selected crops'.tr,
              style: TextStyle(color: Colors.yellow[800], fontSize: 20),
            ),
            const SizedBox(
              height: 7,
            ),
          ]),
        ),
        // show all the selected crops with vertically scrollable list
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: CropHealthselection.selectedcrops.length,
              itemBuilder: (BuildContext context, int index) {
                return TextButton(
                  onPressed: () {
                    if (CropHealthselection.selectedcrops[index].tr == 'Cotton'.tr) {
                      Navigator.pushNamed(context, MyRoutes.cottonhealthhome);
                    }
                    else if (CropHealthselection.selectedcrops[index].tr == 'Banana'.tr) {
                      Navigator.pushNamed(context, MyRoutes.bananahealthhome);
                    }
                  },
                  child: Container(
                    // align
                    decoration: BoxDecoration(
                      color: Colors.black45.withOpacity(.1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 19, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 90,
                          height: 90,
                          child: Image.asset(
                            'assets/crophealth/${CropHealthselection.selectedcrops[index]}.png',
                            height: 90,
                          ),
                        ),
                        Container(
                          // padding: const EdgeInsets.only(right: 40),
                          margin: const EdgeInsets.only(right: 50) ,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(CropHealthselection.selectedcrops[index].tr,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20)),
                                const SizedBox(
                                  height: 5,
                                ),
                                // display day after sowing from dayaftersowing in api.dart
                                Text(
                                  // u should show day if day after sowing is 0 or 1. if it is 2 or 3 then show days
                                  '${'Days after sowing:'.tr}${CropHealthselection.dayaftersowing[CropHealthselection.selectedcrops[index]]} ${'days'.tr}',
                                  style: const TextStyle(
                                      color: Colors.black54, fontSize: 13),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    backgroundColor: Colors.green[500],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, MyRoutes.newrootRoute, (route) => false);
                  // remove /selectavailablecrops from the stack
                  // Navigator.popUntil(context, ModalRoute.withName(MyRoutes.CropHealth));
                  // // now navigate to the next page
                  Navigator.pushNamed(context, MyRoutes.selectavailablecrops);
                },
                child: Text(
                  'Add Crops'.tr,
                  style: const TextStyle(color: Colors.white,fontSize: 15),
                )),
            const SizedBox(
              height: 10,
            ),
          ]),
        ));

    // TextButton(onPressed: () {
    //                             Navigator.pushNamedAndRemoveUntil(context, MyRoutes.newrootRoute, (route) => false);
    //                     // remove /selectavailablecrops from the stack
    //                     // Navigator.popUntil(context, ModalRoute.withName(MyRoutes.CropHealth));
    //                     // // now navigate to the next page
    //                     Navigator.pushNamed(context, MyRoutes.selectavailablecrops);
    // } , child: Text('Add Crops')
    // )

    // ignore: non_constant_identifier_names
//   Scaffold Choosingcrops(BuildContext context) {
//     return Scaffold(
//       appBar: // make background transparent
//           AppBar(
//         // back button color
//         iconTheme: const IconThemeData(color: Colors.black),
//         //increase the height of the appbar
//         toolbarHeight: 110,
//         // give border color to the appbar
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         // center title
//         centerTitle: true,
//         // caption below title

//         title: Column(children: const [
//           SizedBox(
//             height: 10,
//           ),
//           Text(
//             'Select Your Crop',
//             style: TextStyle(color: Colors.green, fontSize: 20),
//           ),
//           SizedBox(
//             height: 7,
//           ),
//           Text(
//             'Select a crop so that we can help you',
//             style: TextStyle(color: Colors.black54, fontSize: 13),
//           ),
//         ]),
//       ),
//       // if the user has not selected any crop then show the below body. Else show the selected crops
//       // body: CropHealthselection.selectedcrops.length == 0
//       //     ? const CropHealthBody()
//       //     : const SelectedCropBody());

//       body: SingleChildScrollView(
//         child: Column(children: [
//           const SizedBox(
//             height: 10,
//           ),
//           Row(
//               // space between the two buttons
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       if (CropHealthselection.cropsbool['Cotton'] == false) {
//                         CropHealthselection.cropsbool['Cotton'] = true;
//                         CropHealthselection.selectedcrops.add('Cotton');
//                       } else {
//                         CropHealthselection.cropsbool['Cotton'] = false;
//                         CropHealthselection.selectedcrops.remove('Cotton');
//                       }
//                     });
//                   },
//                   child: Column(
//                     children: [
//                       // show checkbox icon if the crops bool value is true

//                       // ( CropHealthselection.cropsbool['Cotton']! ? Icon(Icons.check_circle, color: Colors.green,  ) : Container( height:  , )),
//                       SizedBox(
//                           width: 100,
//                           height: 10,
//                           child: CropHealthselection.cropsbool['Cotton']!
//                               ? Container(
//                                   // align the icon to the right of the container
//                                   alignment: Alignment.centerRight,
//                                   child: const Icon(
//                                     Icons.check_circle,
//                                     color: Colors.green,
//                                   ),
//                                 )
//                               : Container()),
//                       SizedBox(
//                         width: 100,
//                         height: 100,
//                         child: Image.asset(
//                           'assets/crophealth/cottoncrop.png',
//                           height: 100,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       const Text(
//                         'Cotton',
//                         style: TextStyle(color: Colors.black),
//                       )
//                     ],
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       if (CropHealthselection.cropsbool['Banana'] == false) {
//                         CropHealthselection.cropsbool['Banana'] = true;
//                         CropHealthselection.selectedcrops.add('Banana');
//                       } else {
//                         CropHealthselection.cropsbool['Banana'] = false;
//                         CropHealthselection.selectedcrops.remove('Banana');
//                       }
//                     });
//                   },
//                   child: Column(
//                     children: [
//                       SizedBox(
//                           width: 100,
//                           height: 10,
//                           child: CropHealthselection.cropsbool['Banana']!
//                               ? Container(
//                                   // align the icon to the right of the container
//                                   alignment: Alignment.centerRight,
//                                   child: const Icon(
//                                     Icons.check_circle,
//                                     color: Colors.green,
//                                   ),
//                                 )
//                               : Container()),
//                       SizedBox(
//                         width: 100,
//                         height: 100,
//                         child: Image.asset(
//                           'assets/crophealth/bananacrop.png',
//                           height: 100,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       const Text('Banana',
//                           style: TextStyle(color: Colors.black))
//                     ],
//                   ),
//                 ),
//               ]),
//           const SizedBox(
//             height: 15,
//           ),
//           Row(
//               // space between the two buttons
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 // create a rounded button and keep a image inside it and on press of that

//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       if (CropHealthselection.cropsbool['Sugarcane'] == false) {
//                         CropHealthselection.cropsbool['Sugarcane'] = true;
//                         CropHealthselection.selectedcrops.add('Sugarcane');
//                       } else {
//                         CropHealthselection.cropsbool['Sugarcane'] = false;
//                         CropHealthselection.selectedcrops.remove('Sugarcane');
//                       }
//                     });
//                   },
//                   child: Column(
//                     children: [
//                       SizedBox(
//                           width: 100,
//                           height: 10,
//                           child: CropHealthselection.cropsbool['Sugarcane']!
//                               ? Container(
//                                   // align the icon to the right of the container
//                                   alignment: Alignment.centerRight,
//                                   child: const Icon(
//                                     Icons.check_circle,
//                                     color: Colors.green,
//                                   ),
//                                 )
//                               : Container()),
//                       SizedBox(
//                         width: 100,
//                         height: 100,
//                         child: Image.asset(
//                           'assets/crophealth/sugarcanecrop.png',
//                           height: 100,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       const Text('Sugarcane',
//                           style: TextStyle(color: Colors.black))
//                     ],
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       if (CropHealthselection.cropsbool['Tomato'] == false) {
//                         CropHealthselection.cropsbool['Tomato'] = true;
//                         CropHealthselection.selectedcrops.add('Tomato');
//                       } else {
//                         CropHealthselection.cropsbool['Tomato'] = false;
//                         CropHealthselection.selectedcrops.remove('Tomato');
//                       }
//                     });
//                   },
//                   child: Column(
//                     children: [
//                       SizedBox(
//                           width: 100,
//                           height: 10,
//                           child: CropHealthselection.cropsbool['Tomato']!
//                               ? Container(
//                                   // align the icon to the right of the container
//                                   alignment: Alignment.centerRight,
//                                   child: const Icon(
//                                     Icons.check_circle,
//                                     color: Colors.green,
//                                   ),
//                                 )
//                               : Container()),
//                       SizedBox(
//                         width: 100,
//                         height: 100,
//                         child: Image.asset(
//                           'assets/crophealth/tomatocrop.png',
//                           height: 100,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       const Text('Tomato',
//                           style: TextStyle(color: Colors.black))
//                     ],
//                   ),
//                 ),
//               ]),
//           const SizedBox(
//             height: 15,
//           ),
//           Row(
//               // space between the two buttons
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 // create a rounded button and keep a image inside it and on press of that
// // wrap this in a gesture detector and on tap of this button navigate to the next page

//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       if (CropHealthselection.cropsbool['Wheat'] == false) {
//                         CropHealthselection.cropsbool['Wheat'] = true;
//                         CropHealthselection.selectedcrops.add('Wheat');
//                       } else {
//                         CropHealthselection.cropsbool['Wheat'] = false;
//                         CropHealthselection.selectedcrops.remove('Wheat');
//                       }
//                     });
//                   },
//                   child: Column(
//                     children: [
//                       SizedBox(
//                           width: 100,
//                           height: 10,
//                           child: CropHealthselection.cropsbool['Wheat']!
//                               ? Container(
//                                   // align the icon to the right of the container
//                                   alignment: Alignment.centerRight,
//                                   child: const Icon(
//                                     Icons.check_circle,
//                                     color: Colors.green,
//                                   ),
//                                 )
//                               : Container()),
//                       SizedBox(
//                         width: 100,
//                         height: 100,
//                         child: Image.asset(
//                           'assets/crophealth/wheatcrop.png',
//                           height: 100,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       const Text('Wheat',
//                           style: TextStyle(color: Colors.black))
//                     ],
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       if (CropHealthselection.cropsbool['Potato'] == false) {
//                         CropHealthselection.cropsbool['Potato'] = true;
//                         CropHealthselection.selectedcrops.add('Potato');
//                       } else {
//                         CropHealthselection.cropsbool['Potato'] = false;
//                         CropHealthselection.selectedcrops.remove('Potato');
//                       }
//                     });
//                   },
//                   child: Column(
//                     children: [
//                       SizedBox(
//                           width: 100,
//                           height: 10,
//                           child: CropHealthselection.cropsbool['Potato']!
//                               ? Container(
//                                   // align the icon to the right of the container
//                                   alignment: Alignment.centerRight,
//                                   child: const Icon(
//                                     Icons.check_circle,
//                                     color: Colors.green,
//                                   ),
//                                 )
//                               : Container()),
//                       SizedBox(
//                         width: 100,
//                         height: 100,
//                         child: Image.asset(
//                           'assets/crophealth/potatocrop.png',
//                           height: 100,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       const Text('Potato',
//                           style: TextStyle(color: Colors.black))
//                     ],
//                   ),
//                 ),
//               ]),

//           const SizedBox(
//             height: 30,
//           ),

//           // create a rounded button for selecting the crops

//           TextButton(
//             onPressed: () {
//               // show a dialog box which will show the selected crops
//               showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       title: const Text(
//                         // show like this selected these many number of crops
//                         'Selected crops' ,
//                         textAlign: TextAlign.center,
//                       ),
//                       content: // show all these crops with comma separated

//                       Text(CropHealthselection.cropsbool.keys.where((k) => CropHealthselection.cropsbool[k] == true).toList().join(', '),textAlign: TextAlign.center,style: const TextStyle(color: Colors.black54,),
//                       ),

//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text(
//                             'Ok',
//                             style: TextStyle(color: Colors.blue),
//                           ),
//                         )
//                       ],
//                     );
//                   });
//             },
//             child: const Text(
//               'Confirm',
//               style: TextStyle(color: Colors.white),
//             ),
//             style: TextButton.styleFrom(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
//                 backgroundColor: Colors.green,
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20)))),
//           )
//         ]),
//       )
//       );
  }
}
