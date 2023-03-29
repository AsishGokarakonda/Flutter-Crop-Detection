import 'package:flutter/material.dart';
import 'package:crop_recommend/utils/api.dart';

import '../../utils/routes.dart'; 
import 'package:get/get.dart';
class CropChoiceHome extends StatefulWidget {
  const CropChoiceHome({super.key});

  @override
  State<CropChoiceHome> createState() => _CropChoiceHomeState();
}

class _CropChoiceHomeState extends State<CropChoiceHome> {
  @override
  Widget build(BuildContext context) {
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
    // body: Cropchoiceselection.selectedcrops.length == 0
    //     ? const CropChoiceBody()
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
                    if (Cropchoiceselection.cropsbool['Cotton'] == false) {
                      Cropchoiceselection.cropsbool['Cotton'] = true;
                      Cropchoiceselection.selectedcrops.add('Cotton');
                    } else {
                      Cropchoiceselection.cropsbool['Cotton'] = false;
                      Cropchoiceselection.selectedcrops.remove('Cotton');
                    }
                  });
                },
                child: Column(
                  children: [
                    // show checkbox icon if the crops bool value is true

                    // ( Cropchoiceselection.cropsbool['Cotton']! ? Icon(Icons.check_circle, color: Colors.green,  ) : Container( height:  , )),
                    SizedBox(
                        width: 100,
                        height: 10,
                        child: Cropchoiceselection.cropsbool['Cotton']!
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
                        'assets/cropchoice/Cotton.png',
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
                    if (Cropchoiceselection.cropsbool['Banana'] == false) {
                      Cropchoiceselection.cropsbool['Banana'] = true;
                      Cropchoiceselection.selectedcrops.add('Banana');
                    } else {
                      Cropchoiceselection.cropsbool['Banana'] = false;
                      Cropchoiceselection.selectedcrops.remove('Banana');
                    }
                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                        width: 100,
                        height: 10,
                        child: Cropchoiceselection.cropsbool['Banana']!
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
                        'assets/cropchoice/Banana.png',
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
                    if (Cropchoiceselection.cropsbool['Sugarcane'] == false) {
                      Cropchoiceselection.cropsbool['Sugarcane'] = true;
                      Cropchoiceselection.selectedcrops.add('Sugarcane');
                    } else {
                      Cropchoiceselection.cropsbool['Sugarcane'] = false;
                      Cropchoiceselection.selectedcrops.remove('Sugarcane');
                    }
                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                        width: 100,
                        height: 10,
                        child: Cropchoiceselection.cropsbool['Sugarcane']!
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
                        'assets/cropchoice/Sugarcane.png',
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
                    if (Cropchoiceselection.cropsbool['Tomato'] == false) {
                      Cropchoiceselection.cropsbool['Tomato'] = true;
                      Cropchoiceselection.selectedcrops.add('Tomato');
                    } else {
                      Cropchoiceselection.cropsbool['Tomato'] = false;
                      Cropchoiceselection.selectedcrops.remove('Tomato');
                    }
                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                        width: 100,
                        height: 10,
                        child: Cropchoiceselection.cropsbool['Tomato']!
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
                        'assets/cropchoice/Tomato.png',
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
                    if (Cropchoiceselection.cropsbool['Wheat'] == false) {
                      Cropchoiceselection.cropsbool['Wheat'] = true;
                      Cropchoiceselection.selectedcrops.add('Wheat');
                    } else {
                      Cropchoiceselection.cropsbool['Wheat'] = false;
                      Cropchoiceselection.selectedcrops.remove('Wheat');
                    }
                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                        width: 100,
                        height: 10,
                        child: Cropchoiceselection.cropsbool['Wheat']!
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
                        'assets/cropchoice/Wheat.png',
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
                    if (Cropchoiceselection.cropsbool['Potato'] == false) {
                      Cropchoiceselection.cropsbool['Potato'] = true;
                      Cropchoiceselection.selectedcrops.add('Potato');
                    } else {
                      Cropchoiceselection.cropsbool['Potato'] = false;
                      Cropchoiceselection.selectedcrops.remove('Potato');
                    }
                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                        width: 100,
                        height: 10,
                        child: Cropchoiceselection.cropsbool['Potato']!
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
                        'assets/cropchoice/Potato.png',
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
          onPressed: () {
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
                      Cropchoiceselection.cropsbool.keys.where((k) => Cropchoiceselection.cropsbool[k] == true).toList().join(', ')
                      // Cropchoiceselection.cropsbool.keys.where((k) => Cropchoiceselection.cropsbool[k] == true).toList().join(', ')
                      ,textAlign: TextAlign.center,style: const TextStyle(color: Colors.black54,),
                    ),

                    actions: [
                      TextButton(
                        onPressed: () {
                          //  Navigator.pushNamedAndRemoveUntil(context,MyRoutes.cropchoice, (route) => false);
                          // remove all the routes from the stack and add /home to the stack
                          Navigator.pushNamedAndRemoveUntil(context, MyRoutes.newrootRoute, (route) => false);
                          // remove /selectavailablecrops from the stack
                          // Navigator.popUntil(context, ModalRoute.withName(MyRoutes.cropchoice));
                          // // now navigate to the next page
                          Navigator.pushNamed(context, MyRoutes.cropchoice);
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

  // Scaffold CropChoiceHome(BuildContext context) {
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
  //             Navigator.pushNamed(context, '/cropchoice');
  //           },
  //           child: const Text('Select Crops'),
  //         ),
  //       ],
  //     ),
  //   ),
  // );
  // }
}