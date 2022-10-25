import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
class DetectDisease extends StatefulWidget {
  const DetectDisease({Key? key}) : super(key: key);

  @override
  State<DetectDisease> createState() => _DetectDiseaseState();
}

class _DetectDiseaseState extends State<DetectDisease> {
  File? image;
  final picker = ImagePicker();
  bool showspinner = false;
  bool showdialog = false;
  String? disease;
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    } else {
      print('No Image Selected');
    }
  }

  Future<void> uploadImage(File file, BuildContext context ) async {
    setState(() {
      showspinner = true;
    });
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://10.196.12.31:8000/api/addcrop/'));
    // get jwt token from secure storage
    final storage = FlutterSecureStorage();
    var jwt = await storage.read(key: 'jwt');
    Map<String, String> headers = {
      'Content-type': 'multipart/form-data',
      'Accept': 'application/json',
      'jwt': jwt!,
    };
    request.files.add(
      http.MultipartFile(
        'image',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: basename(file.path),
      ),
    );
    print(basename(file.path));
    request.headers.addAll(headers);
    request.fields.addAll({
      'crop_name': 'potato',
    });
    var response = await request.send();
    // save the image in images folder using imagepicker
    // get image path and keep it in a variable
    setState(() {
      showspinner = false;

      var secresponse = http.Response.fromStream(response);
      secresponse.then((value) {
        print(value.body);
        // decode the json response
        var decoded = jsonDecode(value.body);
        print(decoded['cropdisease']);
        disease = decoded['cropdisease'];
        // it is opening gallery again. I want to show the dialog box here
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Disease'),
              content: Text(disease!),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
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
        title: const Text(
          'Disease Detector',
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
                   Text(
                    'Detect the disesase',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[300]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                   Text(
                    'Upload image of a crop to detect disease',
                    style: GoogleFonts.secularOne(
                      fontSize: 13,
                      color: Color.fromARGB(255, 172, 172, 173),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: const Icon(
                                  Icons.upload_file,
                                  color: Colors.black,
                                  size: 100,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Tap To Upload',
                                style: TextStyle(
                                  color: Colors.green[300],
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              )
                            ])
                          : Container(
                              child: Center(
                              child: Image.file(
                                File(image!.path).absolute,
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                            )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   GestureDetector(
                          onTap: () {
                            uploadImage(image!, context);
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
                                  child: const Text(
                                    'Upload Image',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
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
            ]
            ),
          ),
        ),
      ),
    );
  }
}
