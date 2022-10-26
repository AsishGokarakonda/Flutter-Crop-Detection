import 'package:crop_recommend/HomePage.dart';
import 'package:crop_recommend/screens/home/adminhome/admin_home.dart';
import 'package:crop_recommend/screens/home/pesthome/detect_disease.dart';
import 'package:crop_recommend/screens/home/new_root_page.dart';
import 'package:crop_recommend/screens/home/pesthome/pest_home.dart';
import 'package:crop_recommend/screens/home/pesthome/your_crops.dart';
import 'package:crop_recommend/screens/home/profile_page.dart';
import 'package:crop_recommend/screens/onboarding/onboard.dart';
import 'package:crop_recommend/screens/signing/admin_login.dart';
import 'package:crop_recommend/screens/signing/before_login.dart';
import 'package:crop_recommend/screens/signing/login_page.dart';
import 'package:crop_recommend/utils/routes.dart';
import 'package:flutter/material.dart';

import 'package:crop_recommend/screens/signing/forgotPassword.dart';
import 'package:crop_recommend/screens/signing/signup_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

var jwt;
int initScreen=0;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = FlutterSecureStorage();
  jwt = await storage.read(key: 'jwt');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = (await prefs.getInt("initScreen")) ?? 0;
  await prefs.setInt("initScreen", 1);
  print('initScreen ${initScreen}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  // check for jwt token. if present, go to home page else go to login page


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        // if it is first time, go to onboarding page else go to login page if jwt is null else go to home page

        initialRoute: initScreen == 0 ? MyRoutes.onboardingRoute : MyRoutes.beforeloginRoute,
        routes: {
          MyRoutes.homeRoute: (context) => const HomePage(),
          MyRoutes.loginRoute: (context) => const LoginPage(),
          MyRoutes.forgotPasswordRoute: (context) => const ForgotPassword(),
          MyRoutes.signupRoute: (context) => const SignupPage(),
          MyRoutes.onboardingRoute: (context) => const Onboarding(),
          MyRoutes.newrootRoute: (context) => const NewRootPage(),
          MyRoutes.detectdiseaseRoute: (context) => const DetectDisease(),
          MyRoutes.pesthomeRoute: (context) => const PestHome(),
          MyRoutes.profileRoute: (context) => const ProfilePage(),
          MyRoutes.yourcropRoute: (context) => const YourCrops(),
          MyRoutes.adminloginRoute:(context) => const AdminLoginPage(),
          MyRoutes.beforeloginRoute:(context) => const BeforeLogin(),
          MyRoutes.adminhomeRoute:(context) => const AdminHome(),
        });
  }
}
