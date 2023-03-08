import 'dart:convert';

import 'package:crop_recommend/models/plant.dart';
import 'package:flutter/material.dart';
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
      const storage = FlutterSecureStorage();
      var jwt = await storage.read(key: 'jwt');
      // pass jwt token in the header
      var response =
          await http.get(Uri.parse('${APILoad.api}/crops/getcrop/'), headers: {
        'jwt': jwt!,
      });
      crops = [];
      var data = json.decode(response.body);
      data.forEach((crop) {
        Plant p = Plant(
          id: crop['id'],
          user: crop['user'],
          cropName: crop['crop_name'],
          image: crop['image'],
          cropdisease: crop['cropdisease'],
        );
        crops.add(p);
      });
      setState(() {
        crops = crops;
      });
      return crops;
    } catch (e) {
      return crops;
    }
  }

  @override
  void initState() {
    getCrops();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // create list of plant type
    // getCrops();
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<String> plantTypes = [
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
        title: const Text(
          'Your Crops',
          style: TextStyle(color: Colors.black),
        ),
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
                  decoration: BoxDecoration(
                    color: Colors.black45.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
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
                )
              ],
            ),
          ),
          // display planttypes here.
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 50,
              width: size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: plantTypes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Text(
                            plantTypes[index],
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: selectedIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: selectedIndex == index
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
                  height: 240.0,
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
                              height: 180.0,
                              width: 150.0,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "${APILoad.api}${crops[crops.length - index - 1].image}"),
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
                                    crops[crops.length - index - 1]
                                                .cropName
                                                .length >
                                            10
                                        ? crops[crops.length - index - 1]
                                            .cropName
                                            .substring(0, 13)
                                        : crops[crops.length - index - 1]
                                            .cropName,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    crops[crops.length - index - 1].cropdisease,
                                    style: const TextStyle(
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
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),

          const SizedBox(
            height: 20,
          ),
          // Keep heading here
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: const Text(
                'History',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // display all the crops in Row with a scrollable list using listview.builder
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: crops.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.black45.withOpacity(.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
                width: 150.0,
                child: Row(
                  children: [
                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        image: DecorationImage(
                          image: NetworkImage(
                              "${APILoad.api}${crops[crops.length - index - 1].image}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      // keep padding such that the text is in center of the container
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Center(
                                  child: Text(
                                    "Crop Name",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  // if the crop name is too long then display 6 characters and keep dots at the end
                                  crops[crops.length - index - 1]
                                              .cropName
                                              .length >
                                          15
                                      ? "${crops[crops.length - index - 1].cropName.substring(0, 15)}..."
                                      : crops[crops.length - index - 1]
                                          .cropName,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ]),
                          const SizedBox(
                            // remove margin from the top
                            width: 100,
                            child: Divider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                          ),
                          Column(children: [
                            const Center(
                              child: Text(
                                "Disease",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // a line to separate the text
                            Text(
                              crops[crops.length - index - 1].cropdisease,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ]),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
