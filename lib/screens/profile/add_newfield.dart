import 'dart:convert';
// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/api.dart';
import 'package:http/http.dart' as http;

class AddField extends StatefulWidget {
  const AddField({super.key});

  @override
  State<AddField> createState() => _AddFieldState();
}

class _AddFieldState extends State<AddField> {
  static String fieldName = "";
  static String publicCropName = "";
  static double fieldArea = 0.0;
  static double latitude = 0.0;
  static double longitude = 0.0;
  // create a list to take (latitude, longitude) pairs
  static List<List<double>> coordinates = [];
  static int days = 0;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  LocationData? locationData;
  bool isLoading = false;
  static TextEditingController latitudeController = TextEditingController();
  static TextEditingController longitudeController = TextEditingController();

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

  // Future<void> _validationcheck() async {
  //   final validation = _formkey.currentState!.validate();
  //   if (validation) {
  //     _formkey.currentState!.save();
  //     // print(username);
  //     // print(name);
  //     // print(email);
  //     // print(password);
  //   }
  // }

  void getPermission() async {
    if (await Permission.location.isGranted) {
      // Get location
      getLocation();
    } else {
      // Request permission
      Permission.location.request();
    }
  }

  void getLocation() async {
    setState(() {
      isLoading = true;
    });
    locationData = await Location.instance.getLocation();
    setState(() {
      isLoading = false;
      latitude = locationData!.latitude!;
      longitude = locationData!.longitude!;
      latitudeController.text = latitude.toString();
      longitudeController.text = longitude.toString();
    });
    print(latitude);
    print(longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            margin: const EdgeInsets.only(top: 5),
            child: const Text('Add New Field')),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Form(
                key: _formkey,
                child: Column(
                  children: [
                    const Text(
                      'Select Crop grown in the field',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                freeButton(context, 'Cotton'),
                                freeButton(context, 'Sugarcane'),
                                freeButton(context, 'Wheat'),
                              ],
                            ),
                            Row(
                              children: [
                                freeButton(context, 'Tomato'),
                                freeButton(context, 'Maize'),
                                freeButton(context, 'Banana'),
                              ],
                            ),
                          ],
                        )),
                    const GetTextField(
                      hint: 'Name of the field',
                      icon: Icons.person,
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.text,
                    ),
                    const GetTextField(
                      hint: 'Area of the field in acres',
                      icon: Icons.crop,
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.text,
                    ),
                    const GetTextField(
                      hint: 'Days of crop growth',
                      icon: Icons.access_time,
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.text,
                    ),
                    const GetTextField(
                      hint: 'Latitude of the field',
                      icon: Icons.my_location,
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.text,
                    ),
                    const GetTextField(
                      hint: 'Longitude of the field',
                      icon: Icons.my_location,
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.text,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextButton(
                        onPressed: () {
                          getPermission();
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)))),
                        child: const Text(
                          'Get location',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Co-ordinates',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    coordinates.length == 0
                        ? const Text(
                            'No coordinates added',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          )
                        : Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: ListView.builder(
                                itemCount: coordinates.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '(${coordinates[index][0]}, ${coordinates[index][1]})',
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                coordinates.removeAt(index);
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ))
                                      ],
                                    ),
                                  );
                                }),
                          ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            coordinates.add([latitude, longitude]);
                          });
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)))),
                        child: const Text(
                          'Add coordinates',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.green),
                      child: TextButton(
                          onPressed: () async {
                            // 10.196.10.23
                            final validation =
                                _formkey.currentState!.validate();
                            if (validation && publicCropName != "" && coordinates.length >= 4 ) {
                              _formkey.currentState!.save();
                              const storage = FlutterSecureStorage();
                              var jwt = await storage.read(key: 'jwt');
                              await http
                                  .post(
                                      Uri.parse('${APILoad.api}/api/addfield/'),
                                      headers: {
                                        'Content-Type': 'application/json',
                                        'Accept': 'application/json',
                                        'jwt': '$jwt',
                                      },
                                      body: json.encode({
                                        'crop_name': publicCropName,
                                        'field_name': fieldName,
                                        'area': '$fieldArea',
                                        'latitude': '$latitude',
                                        'longitude': '$longitude',
                                        'start_day': '$days',
                                        'coordinates': {
                                          'latitude': coordinates
                                              .map((e) => e[0])
                                              .toList(),
                                          'longitude': coordinates
                                              .map((e) => e[1])
                                              .toList()
                                        }
                                      }))
                                  .then(((value) => {
                                        if (value.statusCode == 200)
                                          {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Field Added'),
                                                    content: const Text(
                                                        'Field is added successfully'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          Navigator.pop(
                                                              context);
                                                          Navigator
                                                              .popAndPushNamed(
                                                                  context,
                                                                  '/allfields');
                                                        },
                                                        child: const Text('OK'),
                                                      )
                                                    ],
                                                  );
                                                })
                                          }
                                      }));
                            } else {
                              if (coordinates.length < 4) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                            'Insufficient Coordinates'),
                                        content: const Text(
                                            'Please add atleast 4 coordinates'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('OK'),
                                          )
                                        ],
                                      );
                                    });
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title:
                                            const Text('Inputs are not valid'),
                                        content: const Text(
                                            'Please fill all the details'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('OK'),
                                          )
                                        ],
                                      );
                                    });
                              }
                            }
                          },
                          child: const Text(
                            'Add Field',
                            style: TextStyle(
                                color: Colors.white,
                                height: 1.4,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                )),
          ],
        )),
      ),
    );
  }

  TextButton freeButton(BuildContext context, String cropName) {
    return TextButton(
      onPressed: () async {
        setState(() {
          publicCropName = cropName;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(cropName,
              style: TextStyle(
                  color: cropName == publicCropName
                      ? Colors.green
                      : Colors.black)),
        ),
      ),
    );
  }
}

class GetTextField extends StatelessWidget {
  const GetTextField({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 30.0, top: 10.0, right: 20.0, bottom: 10.0),
      child: Stack(children: [
        Container(
          height: 56.0,
          width: MediaQuery.of(context).size.width * 0.88,
          decoration: BoxDecoration(
            color: Colors.grey[500]?.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextFormField(
              controller: hint == 'Latitude of the field'
                  ? _AddFieldState.latitudeController
                  : hint == 'Longitude of the field'
                      ? _AddFieldState.longitudeController
                      : null,
              cursorColor: Colors.white54,
              style: const TextStyle(color: Colors.black87, height: 1.4),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: const TextStyle(color: Colors.black54),
                prefixIcon: Icon(
                  icon,
                  color: Colors.black87,
                ),
                hintText: hint,
              ),
              keyboardType: inputType,
              textInputAction: inputAction,
              validator: hint == 'Name of the field'
                  ? (value) {
                      if (value!.isEmpty || value.length < 3) {
                        return 'Field name must be atleast 3 characters';
                      }
                      return null;
                    }
                  : hint == 'Area of the field in acres'
                      ? (value) {
                          // check if value is a double or not
                          if (value!.isEmpty ||
                              double.tryParse(value) == null) {
                            return 'Area must be a number';
                          }
                          return null;
                        }
                      : hint == 'Latitude of the field'
                          ? (value) {
                              // check if value is a double or not
                              if (value!.isEmpty ||
                                  double.tryParse(value) == null) {
                                return 'Latitude must be a number';
                              }
                              return null;
                            }
                          : hint == 'Longitude of the field'
                              ? (value) {
                                  // check if value is a double or not
                                  if (value!.isEmpty ||
                                      double.tryParse(value) == null) {
                                    return 'Longitude must be a number';
                                  }
                                  return null;
                                }
                              : hint == 'Days of crop growth'
                                  // check if value is a integer or not
                                  ? (value) {
                                      if (value!.isEmpty ||
                                          int.tryParse(value) == null) {
                                        return 'Days must be a number';
                                      }
                                      return null;
                                    }
                                  : hint == 'Crop grown in the field'
                                      ? (value) {
                                          if (value!.isEmpty ||
                                              value.length < 3) {
                                            return 'Crop name must be atleast 3 characters';
                                          }
                                          return null;
                                        }
                                      : (value) {
                                          if (value!.isEmpty ||
                                              double.tryParse(value) == null) {
                                            return 'Longitude must be a number';
                                          }
                                          return null;
                                        },
              onSaved: (value) {
                if (hint == 'Name of the field') {
                  _AddFieldState.fieldName = value!;
                } else if (hint == 'Area of the field in acres') {
                  _AddFieldState.fieldArea = double.parse(value!);
                } else if (hint == 'Latitude of the field') {
                  _AddFieldState.latitude = double.parse(value!);
                } else if (hint == 'Longitude of the field') {
                  _AddFieldState.longitude = double.parse(value!);
                } else if (hint == 'Days of crop growth') {
                  _AddFieldState.days = int.parse(value!);
                } else if (hint == 'Crop grown in the field') {
                  _AddFieldState.publicCropName = value!;
                }
              },
            ),
          ),
        ),
      ]),
    );
  }
}
