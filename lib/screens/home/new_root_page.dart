import 'dart:convert';

import 'package:crop_recommend/models/plant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NewRootPage extends StatefulWidget {
  const NewRootPage({Key? key}) : super(key: key);

  @override
  State<NewRootPage> createState() => _NewRootPageState();
}

class _NewRootPageState extends State<NewRootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Root'),
        ),
        body: Column(children: [
          SizedBox(height: 10,),
          Row(
              // space between the two buttons
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // create a rounded button and keep a image inside it and on press of that

                TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            'assets/home/cropchoice.png',
                            height: 100,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Text('Crop Choice',style: TextStyle(
                          color: Colors.black
                        ),)
                      ],
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            'assets/home/dashboard.png',
                            height: 100,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Text('Your Dashboard',
                            style: TextStyle(color: Colors.black))
                      ],
                    )),
              ]),
          SizedBox(
            height: 15,
          ),
          Row(
              // space between the two buttons
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // create a rounded button and keep a image inside it and on press of that

                TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            'assets/home/crophealth.png',
                            height: 100,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Text('Crop Health')
                      ],
                    )),
                TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            'assets/home/pest.png',
                            height: 100,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Text('Pest Management')
                      ],
                    )),
              ]),
          SizedBox(
            height: 15,
          ),
          Row(
              // space between the two buttons
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // create a rounded button and keep a image inside it and on press of that

                TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            'assets/home/market.png',
                            height: 100,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Text('Market Choice')
                      ],
                    )),
                TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            'assets/home/weed.png',
                            height: 100,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Text('Weed Management')
                      ],
                    )),
              ]),
        ]));
  }
}
