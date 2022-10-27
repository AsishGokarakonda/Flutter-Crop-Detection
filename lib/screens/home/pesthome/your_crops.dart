import 'dart:convert';

import 'package:crop_recommend/models/plant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:crop_recommend/utils/api.dart';

class YourCrops extends StatefulWidget {
  const YourCrops({Key? key}) : super(key: key);

  @override
  State<YourCrops> createState() => _YourCropsState();
}

class _YourCropsState extends State<YourCrops> {
   List<Plant> crops = [];
  Future<List<Plant>> getCrops() async {
    try {
      final storage = FlutterSecureStorage();
      var jwt = await storage.read(key: 'jwt');
      // pass jwt token in the header
      var response = await http
          .get(Uri.parse('${APILoad.api}/crops/getcrop/'), headers: {
        'jwt': jwt!,
      });
      crops = [];
      print(response.body);
      var data = json.decode(response.body);
      data.forEach((crop) {
        Plant p = Plant(
          id: crop['id'],
          user: crop['user'],
          crop_name: crop['crop_name'],
          image: crop['image'],
          cropdisease: crop['cropdisease'],
        );
        crops.add(p);
      });
      print(crops.length);
      setState(() {
        crops = crops;
      });
      return crops;
    } catch (e) {
      print(e);
      return crops;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getCrops();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // create list of plant type
    // getCrops();
    print(crops);
    int _selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<String> _plantTypes = [
      'Latest',
      'Potato',
      'Tomato',
      'Wheat',
      'Rice',
    ];

    // get all the crops from the database

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        title: const Text('Your Crops',style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  width: size.width * .9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black54.withOpacity(.6),
                      ),
                      const Expanded(
                          child: TextField(
                        showCursor: false,
                        decoration: InputDecoration(
                          hintText: 'Search Plant',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      )),
                      // Icon(
                      //   Icons.mic,
                      //   color: Colors.black54.withOpacity(.6),
                      // ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black45.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                )
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 50,
              width: size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _plantTypes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          child: Text(
                            _plantTypes[index],
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: _selectedIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: _selectedIndex == index
                                  ? Colors.blue
                                  : Colors.black54.withOpacity(.6),
                            ),
                          )),
                    );
                  })),
            // display the crops here with FutureBuilder
            FutureBuilder(
              future: getCrops(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    // keep height relative to the screen size
                    height: 200.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5 > crops.length ? crops.length : 5,
                      itemBuilder: (BuildContext context, int index) {
                        // display the crops from crops list after making the api call

                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.black45.withOpacity(.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: 150.0,
                          child: Column(
                            children: [
                              Container(
                                height: 150.0,
                                width: 150.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "${APILoad.api}${crops[crops.length - index-1].image}"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // if the crop name is too long then display only 10 characters
                                      crops[crops.length - index-1].crop_name.length > 10
                                          ? crops[crops.length - index-1].crop_name.substring(0, 13)
                                          : crops[crops.length - index-1].crop_name,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      crops[crops.length - index-1].cropdisease,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),

          // keep a log out button here
          // Center(
          //   // logout button
          //   child: GestureDetector(
          //     onTap: () async {
          //       final storage = FlutterSecureStorage();
          //       await storage.delete(key: 'jwt');
          //       Navigator.pushReplacementNamed(context, '/login');
          //     },
          //     child: Container(
          //       padding: const EdgeInsets.symmetric(vertical: 16),
          //       decoration: BoxDecoration(
          //         color: Colors.deepOrange,
          //         borderRadius: BorderRadius.circular(30),
          //       ),
          //       width: MediaQuery.of(context).size.width - 150,
          //       alignment: Alignment.center,
          //       child: const Text(
          //         'Logout',
          //         style: TextStyle(color: Colors.white, fontSize: 16),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      )),
    );
  }
}