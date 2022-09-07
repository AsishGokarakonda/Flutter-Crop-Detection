import 'package:crop_recommend/HomePage.dart';
import 'package:crop_recommend/screens/onboarding/onboard.dart';
import 'package:crop_recommend/screens/signing/login_page.dart';
import 'package:crop_recommend/utils/routes.dart';
import 'package:flutter/material.dart';

import 'package:crop_recommend/screens/signing/forgotPassword.dart';
import 'package:crop_recommend/screens/signing/signup_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: const Onboarding(),
        routes: {
          MyRoutes.homeRoute: (context) => const HomePage(),
          MyRoutes.loginRoute: (context) => const LoginPage(),
          MyRoutes.forgotPasswordRoute: (context) => const ForgotPassword(),
          MyRoutes.signupRoute: (context) => const SignupPage(),
        });
  }
}
