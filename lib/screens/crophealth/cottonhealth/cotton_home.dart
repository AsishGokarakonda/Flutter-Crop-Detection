import 'package:flutter/material.dart';
import '../../../utils/notification_api.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:crop_recommend/utils/api.dart';

import '../../../utils/routes.dart';

class CottonCropHome extends StatefulWidget {
  const CottonCropHome({super.key});

  @override
  State<CottonCropHome> createState() => _CottonCropHomeState();
}

class _CottonCropHomeState extends State<CottonCropHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // back button color
        iconTheme: const IconThemeData(color: Colors.black),
        //increase the height of the appbar
        toolbarHeight: 110,
        // give border color to the appbar
        backgroundColor: Colors.transparent,
        elevation: 0,
        // center title
        centerTitle: true,
        // caption below title

        title: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Cotton',
            style: TextStyle(color: Colors.yellow[800], fontSize: 20),
          ),
          SizedBox(
            height: 7,
          ),
        ]),
      ),
      body:
          // show day after sowing from api.dart

          // Text( 'Day after sowing: 10 days', style: TextStyle(color: Colors.black, fontSize: 20),),

          // give an option to change day after sowing

          Container(
        // center the container
        alignment: Alignment.center,
        padding: const EdgeInsets.all(6),
        child: Column(children: [
          Text(
            '${CropHealthselection.dayaftersowing['Cotton']} Days after sowing',
            style: TextStyle(color: Colors.black, fontSize: 19),
          ),
          SizedBox(
            height: 15,
          ),
          TextButton(
              style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  backgroundColor: Colors.green[500],
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Enter the days after sowing'),
                        content: TextField(
                          keyboardType: TextInputType.number,
                          // show input cant be empty if user presses ok without entering anything
                          
                          onChanged: (value) {
                            // change the day after sowing
                            if (value != null) {
                              setState(() {
                                CropHealthselection.dayaftersowing['Cotton'] =
                                    int.parse(value);
                              });
                            }
                            //  show input cant be empty if user presses ok without entering anything
                          },
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              
                              child: const Text('OK'))
                        ],
                      );
                    });
              },
              child: const Text(
                'Change days after sowing',
                style: TextStyle(color: Colors.white, fontSize: 15),
              )),
        ]),
      ),

      // TextButton(onPressed: () async {
      //    await NotificationService.showNotification(
      //           title: "Title of the notification",
      //           body: "Body of the notification",
      //           scheduled: true,
      //           interval: 5
      //         );
      // }, child: Text('Cotton')),
    );
  }
}
