import 'package:flutter/material.dart';
import 'package:crop_recommend/utils/api.dart'; 

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

      title: Column(children: const [
        SizedBox(
          height: 10,
        ),
        Text(
          'Select Your Crop',
          style: TextStyle(color: Colors.green, fontSize: 20),
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          'Select a crop so that we can help you',
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
                        'assets/cropchoice/cottoncrop.png',
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Cotton',
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
                        'assets/cropchoice/bananacrop.png',
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Banana',
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
                        'assets/cropchoice/sugarcanecrop.png',
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Sugarcane',
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
                        'assets/cropchoice/tomatocrop.png',
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Tomato',
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
                        'assets/cropchoice/wheatcrop.png',
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Wheat',
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
                        'assets/cropchoice/potatocrop.png',
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Potato',
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
                    title: const Text(
                      // show like this selected these many number of crops
                      'Selected crops' ,
                      textAlign: TextAlign.center,
                    ),
                    content: // show all these crops with comma separated

                    Text(Cropchoiceselection.cropsbool.keys.where((k) => Cropchoiceselection.cropsbool[k] == true).toList().join(', '),textAlign: TextAlign.center,style: const TextStyle(color: Colors.black54,),
                    ),

                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Ok',
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  );
                });
          },
          child: const Text(
            'Confirm',
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