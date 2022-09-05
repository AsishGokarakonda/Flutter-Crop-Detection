import 'package:crop_recommend/HomePage.dart';
import 'package:crop_recommend/onboarding/onboard.dart';
import 'package:crop_recommend/signing/LoginPage.dart';
import 'package:crop_recommend/utils/routes.dart';
import 'package:flutter/material.dart';

import 'package:crop_recommend/screens/forgotPassword.dart';

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
        });
  }
}
