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
  List<Circle> allcircles = [];
  List<Polygon> allPolygons =[];

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
    List<Polygon> polygonCoords = [];
    for (var i = 0; i < data.length; i++) {
    List<LatLng> polylatlang = [];
      markers.add(
        Marker(
          markerId: MarkerId(data[i]['id'].toString()),
          position: LatLng(double.parse(data[i]['latitude']),
              double.parse(data[i]['longitude'])),
          infoWindow: InfoWindow(
            title: data[i]['field_name'],
            snippet: data[i]['crop_name'],
           ),
        ),
      );
      for (int j = 0; j < data[i]['coordinates']['latitude'].length; j++) {
        polylatlang.add(LatLng(data[i]['coordinates']['latitude'][j],
            data[i]['coordinates']['longitude'][j]));
      }
      
      polygonCoords.add(
          Polygon(
            polygonId: PolygonId(data[i]['id'].toString()),
            points: polylatlang,
            fillColor: Color.fromARGB(255, 244, 130, 54).withOpacity(0.5),
            strokeWidth: 0,
          ),
        );
    }
    setState(() {
      allMarkers = markers;
      allcircles = circles;
      allPolygons = polygonCoords;
    });
    return data;
  }

  @override
  void initState() {
    getLocations();
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
          target: LatLng(20, 78),
          zoom: 5,
        ),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        polygons: Set.from(allPolygons),
        mapType: MapType.normal,
        markers: Set.from(allMarkers),
      ),
    );
  }
}
