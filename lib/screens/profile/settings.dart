import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'.tr, style: TextStyle(color: Colors.blue)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          // show the back button
          automaticallyImplyLeading: true,
          // change the color of the back button
          iconTheme: const IconThemeData(color: Colors.blue),
        ),
        body: Container(
            padding: const EdgeInsets.all(6),
            alignment: Alignment.center,
            child: Column(
              children: [
                // create a container in which we have an option to select the language. That container should be a rectangle of size of the screen. Inside that we have all the languages avaialable in a row. Each row contains 3 languages. On click of any language it should change the language of the app.

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  // keep container in center
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // color: ,
                    borderRadius: BorderRadius.circular(20),
                    // container should be in center
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Select Language'.tr,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () async {
                              // change the language to english
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('language', 'en_US');
                              Get.updateLocale(const Locale('en', 'US'));
                              Settings.language = 'en_US';
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text('English'.tr,
                                    style: TextStyle(
                                        color: Settings.language == 'en_US'
                                            ? Colors.green
                                            : Colors.black)),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              // change the language to hindi
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('language', 'hi_IN');
                              Get.updateLocale(const Locale('hi', 'IN'));
                              Settings.language = 'hi_IN';
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text('Hindi'.tr,
                                    style: TextStyle(
                                        color: Settings.language == 'hi_IN'
                                            ? Colors.green
                                            : Colors.black)),
                              ),
                            ),
                          ),
                          LanguageButton(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // remove the blue color from the button
      onPressed: () async {
        // change the language to kannada
        SharedPreferences prefs =
            await SharedPreferences.getInstance();
        prefs.setString('language', 'kn_IN');
        Get.updateLocale(const Locale('kn', 'IN'));
        Settings.language = 'kn_IN';
      },
      child: Container(
        // add on click function to change the language
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'Kannada'.tr,
            style: TextStyle(
                color: Settings.language == 'kn_IN'
                    ? Colors.green
                    : Colors.black),
          ),
        ),
      ),
    );
  }
}
