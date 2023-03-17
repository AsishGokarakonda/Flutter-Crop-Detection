import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../utils/api.dart';
import '../../../utils/routes.dart'; 

class DiseaseCheckCrop extends StatefulWidget {
  const DiseaseCheckCrop({super.key});

  @override
  State<DiseaseCheckCrop> createState() => _DiseaseCheckCropState();
}

class _DiseaseCheckCropState extends State<DiseaseCheckCrop> {
  @override
  Widget build(BuildContext context) {
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
          'Select a crop to detect disease',
          style: TextStyle(color: Colors.black54, fontSize: 13),
        ),
      ]),
    ),
    // if the user has not selected any crop then show the below body. Else show the selected crops
    // body: PestManagement.diseaseselectedcrop.length == 0
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
                    if (PestManagement.diseaseselectedcrop!='Cotton'){
                      PestManagement.diseaseselectedcrop='Cotton';
                    }
                    else{
                      PestManagement.diseaseselectedcrop = '';
                    }
                  });
                },
                child: Column(
                  children: [
                    // show checkbox icon if the crops bool value is true

                    // ( PestManagement.diseaseselectedcrop['Cotton']! ? Icon(Icons.check_circle, color: Colors.green,  ) : Container( height:  , )),
                    SizedBox(
                        width: 100,
                        height: 10,
                        child: PestManagement.diseaseselectedcrop=='Cotton'
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
                    if (PestManagement.diseaseselectedcrop!='Banana'){
                      PestManagement.diseaseselectedcrop='Banana';
                    }
                    else{
                      PestManagement.diseaseselectedcrop='';
                    }
                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                        width: 100,
                        height: 10,
                        child: PestManagement.diseaseselectedcrop=='Banana'
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
                    if (PestManagement.diseaseselectedcrop!='Sugarcane'){
                      PestManagement.diseaseselectedcrop='Sugarcane';
                    }
                    else{
                      PestManagement.diseaseselectedcrop='';
                    }
                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                        width: 100,
                        height: 10,
                        child: PestManagement.diseaseselectedcrop=='Sugarcane'
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
                    const Text('Sugarcane',
                        style: TextStyle(color: Colors.black))
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (PestManagement.diseaseselectedcrop!='Tomato'){
                      PestManagement.diseaseselectedcrop = 'Tomato';
                    }
                    else{
                      PestManagement.diseaseselectedcrop='';
                    }
                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                        width: 100,
                        height: 10,
                        child: PestManagement.diseaseselectedcrop=='Tomato'
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
                    if (PestManagement.diseaseselectedcrop!='Wheat'){
                      PestManagement.diseaseselectedcrop='Wheat';
                    }
                    else{
                      PestManagement.diseaseselectedcrop='';
                    }
                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                        width: 100,
                        height: 10,
                        child: PestManagement.diseaseselectedcrop=='Wheat'!
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
                    const Text('Wheat',
                        style: TextStyle(color: Colors.black))
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (PestManagement.diseaseselectedcrop!='Potato'){
                      PestManagement.diseaseselectedcrop= 'Potato';
                    }
                    else{
                      PestManagement.diseaseselectedcrop = '';
                    }
                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                        width: 100,
                        height: 10,
                        child: PestManagement.diseaseselectedcrop=='Potato'
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
            // disable on press of the button if no crops are selected
            if (PestManagement.diseaseselectedcrop.isEmpty) {
              return;
            }
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
                    content: // show the selected crop
                        Text(
                      PestManagement.diseaseselectedcrop,
                      textAlign: TextAlign.center,
                    ),

                    actions: [
                      TextButton(
                        onPressed: () {
                          //  Navigator.pushNamedAndRemoveUntil(context,MyRoutes.cropchoice, (route) => false);
                          // remove all the routes from the stack and add /home to the stack
                          Navigator.pushNamedAndRemoveUntil(context, MyRoutes.pesthomeRoute, (route) => false);
                          Navigator.pushNamed(context, MyRoutes.detectdiseaseRoute);
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
          style: TextButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
          child: const Text(
            'Confirm',
            style: TextStyle(color: Colors.white),
          ),
        )
      ]),
    )
    );
  }
}