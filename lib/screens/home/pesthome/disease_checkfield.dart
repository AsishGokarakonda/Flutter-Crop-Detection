import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiseaseCheckField extends StatefulWidget {
  const DiseaseCheckField({super.key});

  @override
  State<DiseaseCheckField> createState() => _DiseaseCheckFieldState();
}

class _DiseaseCheckFieldState extends State<DiseaseCheckField> {
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
          'Select Your Field'.tr,
          style: TextStyle(color: Colors.green, fontSize: 20),
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          'Select a field to detect disease'.tr,
          style: TextStyle(color: Colors.black54, fontSize: 13),
        ),
      ]),
    ),
    // if the user has not selected any crop then show the below body. Else show the selected crops
    // body: PestManagement.diseaseselectedcrop.length == 0
    //     ? const CropChoiceBody()
    //     : const SelectedCropBody());


    body: SingleChildScrollView(),
    );
  }
}