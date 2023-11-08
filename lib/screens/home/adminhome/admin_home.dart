import 'package:crop_recommend/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // remove the back button
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: const Text('Admin home',style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              // make a rounded button and keep a image inside it and on press of that
              // button navigate to the detect disease page
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/allusers');
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.blue[500],
                            borderRadius: BorderRadius.circular(20)),
                        child: // keep image here
                        // change image size
                         const Image(
                          image: AssetImage('assets/home/allusers.png'),
                         ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                       Text(
                        'All users',
                        style: TextStyle(color: Colors.blue[500]),
                      )
                    ],
                  )),
                // make a rounded button and keep a image inside it and on press of that
                // button navigate to the detect disease page
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/usermaps');
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.green[500],
                            borderRadius: BorderRadius.circular(20)),
                        child: const Icon(
                          Icons.map,
                          color: Colors.black,
                          size: 70,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'User Maps',
                        style: TextStyle(color: Colors.green[500]),
                      )
                    ],
                  )),
            ],
            ),
            // keep logout button here
            // on press of logout button clear the jwt token from the secure storage
            // and navigate to the login page
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                onPressed: () {
                  // delete jwt token from secure storage
                  const storage = FlutterSecureStorage();
                  storage.delete(key: 'jwt');
                  Navigator.pushNamedAndRemoveUntil(context,MyRoutes.beforeloginRoute, (route) => false);
                },
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.red[500],
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(
                        Icons.logout,
                        color: Colors.black,
                        size: 70,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Logout',
                      style: TextStyle(color: Colors.red[500]),
                    )
                  ],
                )),
                TextButton(
                onPressed: () {
                  // delete jwt token from secure storage
                  // const storage = FlutterSecureStorage();
                  // storage.delete(key: 'jwt');
                  // Navigator.pushNamedAndRemoveUntil(context,MyRoutes.beforeloginRoute, (route) => false);
                },
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 252, 169, 54),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(
                        Icons.query_stats,
                        color: Colors.black,
                        size: 70,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Statistics',
                      style: TextStyle(color: Color.fromARGB(255, 252, 169, 54)),
                    )
                  ],
                )),
              ],
            )
            
          ]
          )
        ,))
    );
  }
}