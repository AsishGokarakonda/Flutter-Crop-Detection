import 'dart:convert';

import 'package:crop_recommend/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:crop_recommend/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:crop_recommend/utils/api.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? userdetails;

  Future getUserDetails() async {
    const storage = FlutterSecureStorage();
    final jwt = await storage.read(key: 'jwt');
    var response = await http.get(
      Uri.parse('${APILoad.api}/api/user/'), headers: {
        'jwt': jwt!,
      });
    var data = json.decode(response.body);
    // store the user details in userdetails variable
    userdetails = User.fromJson(data);
    setState(() {
      userdetails = userdetails;
    });
  }

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }
  @override
Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(leading: BackButton() ,title: Text(
        'Profile'.tr,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
      centerTitle: true ,
       )  ,
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
          padding: const EdgeInsets.all(16),
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
      
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: ExactAssetImage('assets/profile/profile.png'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // show user details after fetching from api
              Text(
                userdetails?.name ?? 'loading',
                style: const TextStyle(
                  color: Colors.black12,
                  fontSize: 20,
                ),
              ),
              Text(
                userdetails?.email ?? 'loading',
                style: TextStyle(
                  color: Colors.black.withOpacity(.3),
                ),
              ),
      
      
              const SizedBox(
                height: 30,
              ),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  ProfileWidget(
                    icon: Icons.person,
                    title: 'My Profile'.tr,
                  ),
                  ProfileWidget(
                    icon: Icons.add,
                    title: 'Add Field'.tr,
                  ),
                  ProfileWidget(
                    icon: Icons.settings,
                    title: 'Settings'.tr,
                  ),
                  ProfileWidget(
                    icon: Icons.settings,
                    title: 'FAQs'.tr,
                  ),
                  ProfileWidget(
                    icon: Icons.settings,
                    title: 'About Us'.tr,
                  ),
                  ProfileWidget(
                    icon: Icons.logout,
                    title: 'Log Out'.tr,
                  ),
                ],
              ),
            ],
          ),
        ),
        ]
      ),

    ));
  }
}



// make ProfileWidget

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // if title is Log Out then navigate to login page
      onTap: title =='Add Field'.tr
          ? () async {
            Navigator.pushNamed(context, '/allfields');
            }
      : title == 'Log Out'.tr
          ? () async {
            // remove jwt from secure storage
                const storage = FlutterSecureStorage();
                await storage.delete(key: 'jwt');
                Navigator.pushNamedAndRemoveUntil(context,MyRoutes.beforeloginRoute, (route) => false);
            }
      : title == 'Settings'.tr
      ? () {
        Navigator.pushNamed(context, '/settings');
      }
          : () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.black.withOpacity(.5),
                  size: 24,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black.withOpacity(.4),
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}