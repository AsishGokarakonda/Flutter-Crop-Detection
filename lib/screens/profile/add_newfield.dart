import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/api.dart';
import 'package:http/http.dart' as http;
class AddField extends StatefulWidget {
  const AddField({super.key});

  @override
  State<AddField> createState() => _AddFieldState();
}

class _AddFieldState extends State<AddField> {
  
  //   var locationmessage = "";
  //  void getlocation() async {
  //   // if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
  //   //   // Use location.
  //   //   print("Hi");
  //     // get permission to access location
  //     var permission = await Permission.locationWhenInUse.request();
  //     // check if permission is granted
  //     if (permission == PermissionStatus.granted) {
  //       // get current location
  //       var position = await Geolocator.getCurrentPosition(
  //           desiredAccuracy: LocationAccuracy.high);
  //       var lastposition = await Geolocator.getLastKnownPosition();
  //       print(position);
  //       print(lastposition);
  //       setState(() {
  //         locationmessage = "$position";
  //       });
  //     } else {
  //       print("Location Permission Denied");
  //     }
  //   } 
  //   // else {
  //   //   // Open app settings.
  //   //   print("COOL");
  //   //   openAppSettings();
  //   // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Field'),
      ),
      body: SingleChildScrollView(
        child: Container(
          // center the content
          child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text('UI Todo'),
            ),
            // create a button to add new field
            TextButton(
              onPressed: () {

              },
              child: Text(
                'Get gps location',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  backgroundColor: Colors.green,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            // make a form to add new field which takes latitude and longitude as input
            Center(
              child: Container(
                width: 300,
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name of the field',
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Area of the field',
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Latitude',
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Longitude',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
  //                         // add new field to database
  // const storage = FlutterSecureStorage();
  //   var jwt = await storage.read(key: 'jwt');
  //                          var request = await http.post(
  //       Uri.parse('${APILoad.api}/api/addfield/'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //         'jwt': '$jwt',
  //       },
  //       body: {
  //           "area":area,
  // "field_name":"banana",
  // "latitude":5.55555,
  // "longitude":6.66666
  //                       }

                      // give a pop up message that field is added
                      showDialog(context: context, builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Field Added'),
                        content: const Text('Field is added successfully'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Remove this current page from navigation stack and navigate to all fields page
                              // remove this page from navigation stack
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.popAndPushNamed(context, '/allfields');
                            },
                            child: Text('OK'),
                          )
                        ],
                      );
                    });


                        },
                        child: Text(
                          'Add field',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            backgroundColor: Colors.green,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)))),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )),
        ),
      ),
    );
  }
}
