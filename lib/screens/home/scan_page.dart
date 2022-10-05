import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:path/path.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  File? image;
  final picker = ImagePicker();
  bool showspinner = false;

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

  Future<void> uploadImage(File file) async {
    setState(() {
      showspinner = true;
    });
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://10.196.10.195:8000/api/addcrop/'));
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
    print(request.files);
    var response = await request.send();
    print(response.statusCode);
    setState(() {
      showspinner = false;
    });
    image = null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: 50,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.blue.withOpacity(.15),
                        ),
                        child: Icon(
                          Icons.close,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                )),
            Positioned(
              top: 100,
              right: 20,
              left: 20,
              child: Container(
                width: size.width * .8,
                height: size.height * .8,
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // on tapping this image, it will open the files and user can select the image
    
                      GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: Container(
                          child: image == null
                              ? Column(children: [
                                  Image.asset(
                                    'assets/home/scanpageImg.jpeg',
                                    height: 100,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Tap To Upload',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  )
                                ])
                              : Container(
                                  child: Center(
                                  child: Image.file(
                                    File(image!.path).absolute,
                                    height: 100,
                                    width: 100,
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
                          uploadImage(image!);
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
                      SizedBox(
                        height: 20,
                      ),
    
                      // Image.asset(
                      //   'assets/home/scanpageImg.jpeg',
                      //   height: 100,
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // Text(
                      //   'Tap To Upload',
                      //   style: TextStyle(
                      //     color: Colors.blue,
                      //     fontWeight: FontWeight.w500,
                      //     fontSize: 20,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
