import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:crop_recommend/utils/api.dart';
import '../../../utils/api.dart';
import 'package:get/get.dart';

class DetectDisease extends StatefulWidget {
  const DetectDisease({Key? key}) : super(key: key);

  @override
  State<DetectDisease> createState() => _DetectDiseaseState();
}

class _DetectDiseaseState extends State<DetectDisease> {
  var das;
  File? image;
  final picker = ImagePicker();
  bool showspinner = false;
  bool showdialog = false;
  String? disease;
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    } else {
      // print('No Image Selected');
    }
  }

  Future<void> uploadImage(File file, BuildContext context) async {
    setState(() {
      showspinner = true;
    });
    var request = http.MultipartRequest(
        'POST', Uri.parse('${APILoad.api}/crops/addcrop/'));
    // get jwt token from secure storage
    const storage = FlutterSecureStorage();
    var jwt = await storage.read(key: 'jwt');
    Map<String, String> headers = {
      'Content-type': 'multipart/form-data',
      'Accept': 'application/json',
      'jwt': jwt!,
    };
    // here image is sent by multipart request which converts it to binary and sends it
    request.files.add(
      http.MultipartFile(
        'image',
        file.readAsBytes().asStream(), // image is converted to binary
        file.lengthSync(), // length of the image measured in bytes (binary)
        filename: basename(file
            .path), // file.path is the path of the image basename() is used to get the name of the image
      ),
    );
    // print(basename(file.path));
    request.headers.addAll(headers);
    request.fields.addAll({
      'crop_name': PestManagement.diseaseselectedcrop,
      'dayaftersowing':das
    });
    var response = await request.send();
    // save the image in images folder using imagepicker
    // get image path and keep it in a variable
    setState(() {
      showspinner = false;

      var secresponse = http.Response.fromStream(response);
      secresponse.then((value) {
        // decode the json response
        var decoded = jsonDecode(value.body);
        disease = decoded['cropdisease'];
        // it is opening gallery again. I want to show the dialog box here
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Disease'.tr),
              content: Text(disease!),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'.tr),
                ),
              ],
            );
          },
        );
      });

      image = null;
    });
    // get crop_disese from response
    // show the disease in a dialog box
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title:  Text(
          'Disease Detector'.tr,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Column(
                children: [
// show the selected crop from pestmanagement in api.dart file here
                  Text(
                    '${'Selected Crop'.tr} : ${PestManagement.diseaseselectedcrop}',
                    style: const TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  // create a input field in which user can enter the day after sowing. And this input field can only take numbers
                  // keep this
                  TextField(
                    keyboardType: TextInputType.number,
                    // after entering the number, user can press done button on keyboard and it will go to next field
                    textInputAction: TextInputAction.next,
                    // save the input in a variable
                    onChanged: (value) {
                      das = int.parse(value);  
                    },


                    decoration: InputDecoration(
                      hintText: 'Enter day after sowing'.tr,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      // keep content padding such that hint text is at middle of the box
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      alignLabelWithHint: true,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Text(
                    'Tap on the below icon to take a picture'.tr,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      getImage();
                    },
                    child: Container(
                      child: image == null
                          ? Column(children: [
                              // give background color to the container
                              Container(
                                // keep the height of the container and keep an upload icon inside it and make full container background gray
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                // make border radius to the container
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: const Icon(
                                  Icons.upload_file,
                                  color: Colors.black,
                                  size: 100,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                // keep background color to the container
                                // keep padding to the container
                                padding: const EdgeInsets.all(15),
                                // keep border radius to the container
                                decoration: BoxDecoration(
                                    color: Colors.lightBlue,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                
                                child: Text(
                                  'Tap To Upload'.tr,
                                  style: TextStyle(
                                    // padding to the text
                                    
                                    // keep a nice color other than green , black or white
                                    color: Colors.white,
                                    // keep background color to the text
                                    // backgroundColor: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                  ),
                                ),
                              )
                            ])
                          : Center(
                              child: Image.file(
                                File(image!.path).absolute,
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      // if var das is null, then show a dialog box saying enter day after sowing
                      if (das == null) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Error'.tr),
                              content: Text(
                                  'Please enter day after sowing before uploading image'.tr),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child:  Text('OK'.tr),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        uploadImage(image!, context);
                      }
                    },
                    // if image is selected then upload button should be enabled
                    child: image == null
                        ? const Text('')
                        : Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            width: MediaQuery.of(context).size.width - 100,
                            alignment: Alignment.center,
                            child:  Text(
                              'Upload Image'.tr,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                  ),
                  // showdialog
                  //     ? AlertDialog(
                  //         title: const Text('Disease'),
                  //         content: Text("Disease is ${disease}"),
                  //         actions: [
                  //           TextButton(
                  //             onPressed: () {
                  //               setState(() {
                  //                 showdialog = false;
                  //               });
                  //             },
                  //             child: const Text('Close'),
                  //           )
                  //         ],
                  //       )
                  //     : const Text(''),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
