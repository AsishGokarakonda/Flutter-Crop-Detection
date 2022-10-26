import 'dart:convert';

import 'package:crop_recommend/widgets/curved_buttons.dart';
import 'package:crop_recommend/utils/routes.dart';
import 'package:crop_recommend/widgets/background_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BeforeLogin extends StatefulWidget {
  const BeforeLogin({Key? key}) : super(key: key);

  @override
  State<BeforeLogin> createState() => _BeforeLoginState();
}

class _BeforeLoginState extends State<BeforeLogin> {
  var jwt;
  Future checklogin() async {
    final storage = FlutterSecureStorage();
    jwt = await storage.read(key: 'jwt');
    if (jwt != null) {
      // if user is admin then redirect to admin home page
      // pass jwt token in header
      var request = http.Request(
          'GET', Uri.parse('http://10.196.12.31:8000/api/user/'));
      request.headers.addAll(<String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'jwt': jwt,
      });
      var response = await request.send();
      // get response body
      var responseBody = await response.stream.bytesToString();
      // convert response body to json
      var responseJson = jsonDecode(responseBody);
      // if user is admin then redirect to admin home page
      if (responseJson['is_superuser'] == true) {
        Navigator.pushNamed(context, MyRoutes.adminhomeRoute);
      } else {
        Navigator.pushNamed(context, MyRoutes.newrootRoute);
      }
    }
    return false;
  }

  @override
  void initState() {
    // TODO: implement initState
    // check if already logged in or not
    checklogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  this  is the first page that will be shown to the user in which he can either select admin or user
    return Scaffold(
        appBar:  AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        centerTitle: true,
        title: Column(children: [
            SizedBox(
              height: 10,
            ),
            const Text(
              'Login',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 5,
            ),
            const Text(
              'Login as admin or user',
              style: TextStyle(color: Colors.black38, fontSize: 12),
            ),
          ]),
      ),
        body: Column(
          // space between the two buttons
          // center the buttons horizontally
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/adminlogin');
                },
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.red[300],
                            borderRadius: BorderRadius.circular(20)),
                        child:const Icon(
                          Icons.admin_panel_settings_rounded,
                          color: Colors.black,
                          size: 70,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Admin',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                )),
                           TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.blue[300],
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 70,
                        ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'User',
                      style: TextStyle(color: Colors.blue[400]),
                    )
                  ],
                )),

          ],
        ));
  }
}
