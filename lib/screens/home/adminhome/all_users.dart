import 'dart:convert';

import 'package:crop_recommend/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:crop_recommend/utils/api.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({Key? key}) : super(key: key);

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  List<User> users = [];
    void getusers() async {
    try {
      final storage = FlutterSecureStorage();
      var jwt = await storage.read(key: 'jwt');
      // pass jwt token in the header
      var response = await http
          .get(Uri.parse('${APILoad.api}/api/user/'), headers: {
        'jwt': jwt!,
      });
      print(response.body);
      users=[];
      var data = json.decode(response.body);
      // store the user details in userdetails variable
      data.forEach((user) {
        User p = User(
          id: user['id'],
          username: user['username'],
          name: user['name'],
          email: user['email'],
        );
        users.add(p);
        setState(() {
          users = users;
        });
      });
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    getusers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        title: const Text('All users',style: TextStyle(color: Colors.black),),
      ),
      body: Column(children: [
      ],)
    );
  }
}