import 'dart:convert';

import 'package:crop_recommend/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class UserMaps extends StatefulWidget {
  const UserMaps({Key? key}) : super(key: key);

  @override
  State<UserMaps> createState() => _UserMapsState();
}

class _UserMapsState extends State<UserMaps> {

  // get all user locations from api and show them on map
  List<Marker> allMarkers = [];

  Future getLocations() async {
    // get jwt token from secure storage
    const storage = FlutterSecureStorage();
    var jwt = await storage.read(key: 'jwt');
    var response = await http.get(
      Uri.parse('${APILoad.api}/api/getuserlocation/'),
      headers: {
        'Accept': 'application/json',
        'jwt': jwt!,
      },
    );
    var data = json.decode(response.body);
    // keep them in Marker objects
    List<Marker> markers = [];
    for (var i = 0; i < data.length; i++) {
      markers.add(
        Marker(
          markerId: MarkerId(data[i]['id'].toString()),
          // convert lat and long to double
          position: LatLng(double.parse(data[i]['latitude']), double.parse(data[i]['longitude'])),
          infoWindow: InfoWindow(
            title: data[i]['username'],
            // convert area to string
            snippet: data[i]['area'].toString(),
          ),
        ),
      );
    }
    setState(() {
      allMarkers = markers;
    });
    return data;
  }
  
  // List<Marker> allMarkers = [];
  // List<Marker> list=const [
  //   Marker(markerId: MarkerId('1'),
  //       position: LatLng(27.7172, 85.3240),
  //       infoWindow: InfoWindow(title: 'Kathmandu')),
  //           Marker(markerId: MarkerId('2'),
  //       position: LatLng(28, 85.240),
  //       infoWindow: InfoWindow(title: 'Another')),
  // ];

  @override
  void initState() {
    getLocations();
    // allMarkers.addAll(list);
    super.initState();
  }

  // create a variable of type google map controller
  late GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        title: const Text('User Maps',style: TextStyle(color: Colors.black),),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(17, 85),
          zoom: 3,
        ),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        mapType: MapType.normal,
        markers: Set.from(allMarkers),
      ),
    );
  }
}