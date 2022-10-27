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
  // get all users from api and store it in a variable of type list of user and return it
  Future<List<User>> getusers() async {
    final storage = FlutterSecureStorage();
    var jwt = await storage.read(key: 'jwt');
    var response = await http.get(Uri.parse('${APILoad.api}/api/getusers/'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'jwt': '$jwt',
    });

      var data = jsonDecode(response.body);
      List<User> users = [];
      for (var u in data) {
        User user = User(
            id: u['id'],
            username: u['username'],
            name: u['name'],
            email: u['email'],
            );
        users.add(user);
      }
      return users;
    
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
        Expanded(
          child: FutureBuilder(
            future: getusers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [ListTile(
                        title: Text(snapshot.data[index].username),
                        subtitle: Text(snapshot.data[index].email),
                      ),
                      const Divider(),
                      ]
                    );
                  },
                );
              }
            },
          ),
        ),
      ]),
    );
  }
}