import 'package:flutter/material.dart';

class CropChoiceHome extends StatefulWidget {
  const CropChoiceHome({super.key});

  @override
  State<CropChoiceHome> createState() => _CropChoiceHomeState();
}

class _CropChoiceHomeState extends State<CropChoiceHome> {
    Map<String, bool> cropsbool = {
    'Cotton': false,
    'Banana': false,
    'Tomato': false,
    'Sugarcane': false,
    'Wheat': false,
    'Potato': false,
  };
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: // make background transparent
            AppBar(
          // remove the back button
          automaticallyImplyLeading: false,
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
                        if (cropsbool['Cotton'] == false) {
                          cropsbool['Cotton'] = true;
                        } else {
                          cropsbool['Cotton'] = false;
                        }
                      });
                    },
                    child: Container(
                        child: Column(
                          children: [
                            // show checkbox icon if the crops bool value is true

                          // ( cropsbool['Cotton']! ? Icon(Icons.check_circle, color: Colors.green,  ) : Container( height:  , )),
                          SizedBox(
                            width: 100,
                            height: 10,
                            child: cropsbool['Cotton']! ? Container(
                              // align the icon to the right of the container
                              alignment: Alignment.centerRight,
                              child: const Icon(Icons.check_circle, color: Colors.green,   ),
                            )  : Container()
                          ),
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
                        )),

                  ),
                  Column(
                    children: [
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
                ]),
            const SizedBox(
              height: 15,
            ),
            Row(
                // space between the two buttons
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // create a rounded button and keep a image inside it and on press of that

                  Container(
                      child: Column(
                        children: [
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
                      )),
                  Container(
                      child: Column(
                        children: [
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
// wrap this in a gesture detector and on tap of this button navigate to the next page
                  
                  Container(
                      child: Column(
                        children: [
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
                      )),
                  Container(
                      child: Column(
                        children: [
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
                      )),
                ]),
          ]),
        ));
  }
}
