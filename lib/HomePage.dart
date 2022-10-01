import 'dart:io';

import 'package:crop_recommend/screens/home/cropchoice_page.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:crop_recommend/screens/home/crophealth_page.dart';
import 'package:crop_recommend/screens/home/profile_page.dart';
import 'package:crop_recommend/screens/home/root_page.dart';
import 'package:crop_recommend/screens/home/scan_page.dart';
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

  int _bottomNavIndex=0;
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



List <Widget> pages = const [
  RootPage(),
  CropHealth(),
  CropChoice(),
  ProfilePage()
];


List<IconData> iconList = [
  Icons.home,
  Icons.health_and_safety,
  Icons.select_all,
  Icons.person
];


List<String> titlelist = [
  'Home',
  'Crop Health',
  'Crop Choice',
  'Profile'
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titlelist[_bottomNavIndex],
            style: TextStyle(color: Colors.black54,
            fontWeight:FontWeight.w500,
            fontSize: 24 ),),
            Icon(Icons.notifications,color: Colors.black54,size:30.0)
          ],
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0.0,
      ),
      body:IndexedStack(
        index: _bottomNavIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // getImage();
          // uploadImage(image!);
          // getCrops();
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ScanPage()));
        },
        child: Image.asset('assets/home/scanimg.png',height: 30.0,),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Colors.blue,
        activeColor: Colors.blue,
        inactiveColor: Colors.black54,
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}