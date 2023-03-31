import 'package:crop_recommend/screens/crophealth/EachAdvisory.dart';
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
      // appBar: AppBar(
      //   // back button color
      //   iconTheme: const IconThemeData(color: Colors.black),
      //   //increase the height of the appbar
      //   toolbarHeight: 110,
      //   // give border color to the appbar
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   // center title
      //   centerTitle: true,
      //   // caption below title

      //   title: Column(children: [
      //     const SizedBox(
      //       height: 10,
      //     ),
      //     Text(
      //       'Cotton',
      //       style: TextStyle(color: Colors.yellow[800], fontSize: 20),
      //     ),
      //   ]),
      // ),
      
      body:
          NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.black54 ,
                  elevation: 0,
                  expandedHeight: 300.0,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      // keep title at top 
                      title: const Text("Cotton",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          )),
                      background: Image.asset(
                        'assets/crophealth/CottonHome.png',
                        colorBlendMode: BlendMode.darken ,
                        color: Colors.black.withOpacity(0.25) ,
                        fit: BoxFit.cover,
                      )),
                ),
              ];
            },
            body: SingleChildScrollView(
               physics: const BouncingScrollPhysics(),
              child: Column(children: [
                    Container(
              // center the container
              alignment: Alignment.center,
              child: Column(children: [
                const SizedBox(
                  height: 25,
                ),
                Text(
                  '${CropHealthselection.dayaftersowing['Cotton']} Days after sowing',
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 15),
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
                    Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
            
              child: Column(children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: CottonAdvisory.advisory.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => EachAdvisory(cropName: 'Cotton', dasInAdvisory: '${CottonAdvisory.advisory[index][0]}' ) )
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 20 ),
                        child: Column(children: [
                          Container(
                            height: 200.0,
                            // width: MediaQuery.of(context).size.width - 100.0,
                            decoration: BoxDecoration(
                              // top left, top right border radius should be set
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                // color: Colors.blue,
                                image: DecorationImage(
                                    // decrease the brightness of the image
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.3),
                                        BlendMode.darken),
                                    image: const AssetImage('assets/home/demo.jpg'),
                                    fit: BoxFit.fill)),
                            child: // keep text at bottom of the image
                                Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  '${CottonAdvisory.advisory[index][0]} Days after sowing',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10, right: 10,top:20,bottom: 20),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                  ),
                                color: Color.fromARGB(230, 23, 19, 19)),
                            child: Column(
                              children: [
                                Text(
                                '${CottonAdvisory.advisory[index][1]}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // button for show more 
                              Text('Show more',style: TextStyle(color: Colors.white),),

                              const SizedBox(
                                height: 10,
                              ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ]),
                    )
                  ]),
            ),
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
