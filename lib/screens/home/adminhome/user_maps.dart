import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserMaps extends StatefulWidget {
  const UserMaps({Key? key}) : super(key: key);

  @override
  State<UserMaps> createState() => _UserMapsState();
}

class _UserMapsState extends State<UserMaps> {
  List<Marker> allMarkers = [];
  List<Marker> list=const [
    Marker(markerId: MarkerId('1'),
        position: LatLng(27.7172, 85.3240),
        infoWindow: InfoWindow(title: 'Kathmandu')),
            Marker(markerId: MarkerId('2'),
        position: LatLng(28, 85.240),
        infoWindow: InfoWindow(title: 'Another')),
  ];

  @override
  void initState() {
    allMarkers.addAll(list);
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
        initialCameraPosition: CameraPosition(
          target: LatLng(27, 85),
          zoom: 10,
        ),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        mapType: MapType.satellite,
        markers: Set.from(allMarkers),
      ),
    );
  }
}