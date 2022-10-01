import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File ? image;
  final picker = ImagePicker();
  bool showspinner = false;

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      setState(() {
        image = File(pickedFile.path);
      });
    }
    else{
      print('No Image Selected');
    }
  }

  Future <void> uploadImage(File file) async {
    setState(() {
      showspinner = true;
    });
    var request = http.MultipartRequest('POST', Uri.parse('http://10.196.9.193:8000/api/addcrop/'));
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
    request.fields.addAll(
      {
        'crop_name': 'potato',
      }
    );
    print(request.files);
    var response = await request.send();
    print(response.statusCode);
    setState(() {
      showspinner = false;
    });
    image = null;
  }

  // get all the crops from the database
  Future <void> getCrops() async {
    final storage = FlutterSecureStorage();
    var jwt = await storage.read(key: 'jwt');
    // pass jwt token in the header
    var response = await http.get(Uri.parse('http://10.196.9.193:8000/api/getcrop/'), headers: {
      'jwt': jwt!,
    });
    print(response.body);

  }



  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Scaffold(
        appBar: AppBar(title: const Text('Home Page'),)
        ,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  getImage();
                },
                child: Container(
                  
                  child: image == null ? const Text('No Image Selected') : 
                  Container(
                    child:Center(child: Image.file(
                      File(image!.path).absolute,
                      height: 100,
                      width: 100,
                      fit:BoxFit.cover,
                    ),
                    )
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  uploadImage(image!);
                },
                // if image is selected then upload button should be enabled
                child: image == null ? const Text('') : Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: MediaQuery.of(context).size.width - 150,
                  alignment: Alignment.center,
                  child: const Text('Upload Image', style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                // logout button
                child: GestureDetector(
                  onTap: () async {
                    final storage = FlutterSecureStorage();
                    await storage.delete(key: 'jwt');
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: MediaQuery.of(context).size.width - 150,
                    alignment: Alignment.center,
                    child: const Text('Logout', style: TextStyle(color: Colors.white, fontSize: 16),),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                // get crops button
                child: GestureDetector(
                  onTap: () async {
                    getCrops();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: MediaQuery.of(context).size.width - 150,
                    alignment: Alignment.center,
                    child: const Text('Get Crops', style: TextStyle(color: Colors.white, fontSize: 16),),
                  ),
                ),
              ),
                // get images from the database and display them in a list view
              // FutureBuilder(
              //   future: getCrops(),
              //   builder: (context, snapshot){
              //     if(snapshot.hasData){
              //       return ListView.builder(
              //         shrinkWrap: true,
              //         itemCount: snapshot.data.length,
              //         itemBuilder: (context, index){
              //           return Container(
              //             child: Image.network(snapshot.data[index].image),
              //           );
              //         },
              //       );
              //     }
              //     else{
              //       return const Text('No Data');
              //     }
              //   },
              // ),
            ],
          ),
        )
        
        
      ),
    );
  }
}