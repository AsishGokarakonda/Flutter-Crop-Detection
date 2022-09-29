import 'package:crop_recommend/HomePage.dart';
import 'package:crop_recommend/screens/onboarding/onboard.dart';
import 'package:crop_recommend/screens/signing/login_page.dart';
import 'package:crop_recommend/utils/routes.dart';
import 'package:flutter/material.dart';

import 'package:crop_recommend/screens/signing/forgotPassword.dart';
import 'package:crop_recommend/screens/signing/signup_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

var jwt;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = FlutterSecureStorage();
  jwt = await storage.read(key: 'jwt');
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
        initialRoute: jwt == null ? MyRoutes.loginRoute : MyRoutes.homeRoute,
        routes: {
          MyRoutes.homeRoute: (context) => const HomePage(),
          MyRoutes.loginRoute: (context) => const LoginPage(),
          MyRoutes.forgotPasswordRoute: (context) => const ForgotPassword(),
          MyRoutes.signupRoute: (context) => const SignupPage(),
        });
  }
}
