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
  List<Polyline> allPolylines = [];
  List<Circle> allcircles = [];
  List<LatLng> building = [
    LatLng(12.974567, 77.592199),
    LatLng(12.972270, 77.592083),
    LatLng(12.971392, 77.590279),
    LatLng(12.972894, 77.588854),
    LatLng(12.974567, 77.592199),
  ];

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
    List<Circle> circles = [];
    List<Polyline> polylines = [];
    for (var i = 0; i < data.length; i++) {
      markers.add(
        Marker(
          markerId: MarkerId(data[i]['id'].toString()),
          // convert lat and long to double
          position: LatLng(double.parse(data[i]['latitude']),
              double.parse(data[i]['longitude'])),
          infoWindow: InfoWindow(
            title: data[i]['username'],
            // convert area to string
            snippet: data[i]['area'].toString(),
          ),
        ),
      );
      circles.add(
        Circle(
          circleId: CircleId(data[i]['id'].toString()),
          center: LatLng(double.parse(data[i]['latitude']),
              double.parse(data[i]['longitude'])),
          radius: 1000,
          fillColor: Colors.red.withOpacity(0.5),
          strokeWidth: 0,
        ),
      );
      polylines.add(
        Polyline(
          polylineId: PolylineId(data[i]['id'].toString()),
          color: Colors.red,
          width: 2,
          points: building,
        ),
      );
    }
    setState(() {
      allMarkers = markers;
      allcircles = circles;
      allPolylines = [
        Polyline(
          polylineId: const PolylineId('building'),
          color: Colors.red,
          width: 2,
          points: building,
        ),
      ];
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
        title: const Text(
          'User Maps',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(12.974567, 77.592199),
          zoom: 10,
        ),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        polylines: Set.from(allPolylines),
        circles: Set.from(allcircles),
        mapType: MapType.normal,
        markers: Set.from(allMarkers),
      ),
    );
  }
}
