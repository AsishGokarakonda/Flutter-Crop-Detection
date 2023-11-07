import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../utils/api.dart';
import '../../../utils/routes.dart'; 
import 'package:get/get.dart';

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
          'Select a crop to detect disease'.tr,
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
                    if (PestManagement.diseaseselectedcrop!='Banana'.tr){
                      PestManagement.diseaseselectedcrop='Banana'.tr;
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
                        child: PestManagement.diseaseselectedcrop=='Banana'.tr
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
                    if (PestManagement.diseaseselectedcrop!='Sugarcane'.tr){
                      PestManagement.diseaseselectedcrop='Sugarcane'.tr;
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
                        child: PestManagement.diseaseselectedcrop=='Sugarcane'.tr
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
                    if (PestManagement.diseaseselectedcrop!='Tomato'.tr){
                      PestManagement.diseaseselectedcrop = 'Tomato'.tr;
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
                        child: PestManagement.diseaseselectedcrop=='Tomato'.tr
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
                    if (PestManagement.diseaseselectedcrop!='Wheat'.tr){
                      PestManagement.diseaseselectedcrop='Wheat'.tr;
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
                        child: PestManagement.diseaseselectedcrop=='Wheat'.tr
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
                    if (PestManagement.diseaseselectedcrop!='Potato'.tr){
                      PestManagement.diseaseselectedcrop= 'Potato'.tr;
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
                        child: PestManagement.diseaseselectedcrop=='Potato'.tr
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
          onPressed: () {
            // disable on press of the button if no crops are selected
            if (PestManagement.diseaseselectedcrop.isEmpty) {
              return;
            }
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      // show like this selected these many number of crops
                      'Selected crops'.tr ,
                      textAlign: TextAlign.center,
                    ),
                    content: // show the selected crop
                        Text(
                      PestManagement.diseaseselectedcrop.tr,
                      textAlign: TextAlign.center,
                    ),

                    actions: [
                      TextButton(
                        onPressed: () {
                          PestManagement.dayaftersowing='';
                          Navigator.pushNamedAndRemoveUntil(context, MyRoutes.newrootRoute, (route) => false);
                          Navigator.pushNamed(context, MyRoutes.detectdiseaseRoute);
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
          style: TextButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
          child: Text(
            'Confirm'.tr,
            style: TextStyle(color: Colors.white),
          ),
        )
      ]),
    )
    );
  }
}