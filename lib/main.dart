import 'package:crop_recommend/utils/notification_api.dart';

import '../../../screens/home/adminhome/admin_home.dart';
import '../../../screens/home/adminhome/all_users.dart';
import '../../../screens/home/adminhome/user_maps.dart';
import '../../../screens/home/pesthome/detect_disease.dart';
import '../../../screens/home/all_home_page.dart';
import '../../../screens/home/pesthome/pest_home.dart';
import '../../../screens/home/pesthome/your_crops.dart';
import '../../../screens/profile/profile_page.dart';
import '../../../screens/onboarding/onboard.dart';
import '../../../screens/signing/admin_login.dart';
import '../../../screens/signing/before_login.dart';
import '../../../screens/signing/login_page.dart';
import '../../../utils/routes.dart';
import '../../../screens/profile/add_field.dart';
import '../../../screens/crophealth/selectedcrops.dart';
import '../../../screens/crophealth/cottonhealth/cotton_home.dart';
import '../../../screens/crophealth/cottonhealth/banana_home.dart';
import '../../../screens/crophealth/crophealth_home.dart';
import '../../../screens/home/pesthome/disease_checkcrop.dart';
import '../../../screens/signing/forgot_password.dart';
import '../../../screens/signing/signup_page.dart';
import '../../../screens/profile/settings.dart';
// import '../../..';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

// import 'utils/app_translation.dart';

import '../../utils/app_translation.dart';
import 'screens/crophealth/EachAdvisory.dart';





int initScreen=0;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initializeNotification();

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = (prefs.getInt("initScreen")) ?? 0;
  await prefs.setInt("initScreen", 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: AppTranslation() ,
        locale: const Locale('en', 'US'),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // if it is first time, go to onboarding page else go to login page if jwt is null else go to home page

        initialRoute: initScreen == 0 ? MyRoutes.onboardingRoute : MyRoutes.beforeloginRoute,
        routes: {
          MyRoutes.loginRoute: (context) => const LoginPage(),
          MyRoutes.forgotPasswordRoute: (context) => const ForgotPassword(),
          MyRoutes.signupRoute: (context) => const SignupPage(),
          MyRoutes.onboardingRoute: (context) => const Onboarding(),
          MyRoutes.newrootRoute: (context) => const AllHomePage(),
          MyRoutes.detectdiseaseRoute: (context) => const DetectDisease(),
          MyRoutes.pesthomeRoute: (context) => const PestHome(),
          MyRoutes.profileRoute: (context) => const ProfilePage(),
          MyRoutes.yourcropRoute: (context) => const YourCrops(),
          MyRoutes.adminloginRoute:(context) => const AdminLoginPage(),
          MyRoutes.beforeloginRoute:(context) => const BeforeLogin(),
          MyRoutes.adminhomeRoute:(context) => const AdminHome(),
          MyRoutes.allusersRoute:(context) => const AllUsers(),
          MyRoutes.usermapsRoute:(context) => const UserMaps(),
          MyRoutes.addFieldRoute:(context) => const AddField(),
          MyRoutes.crophealth:(context) => const SelectedCropsHome(),
          MyRoutes.selectavailablecrops:(context) => const CropHealthHome(),
          MyRoutes.cottonhealthhome:(context) => const CottonCropHome(),
          MyRoutes.bananahealthhome:(context) => const BananaCropHome(),
          MyRoutes.diseasecheckcrop:(context) => const DiseaseCheckCrop(),
          MyRoutes.settingsRoute:(context) => const SettingsPage(),
          // MyRoutes.EachAdvisoryRoute:(context) => const EachAdvisory( dasInAdvisory:  , ),

        });
  }
}
