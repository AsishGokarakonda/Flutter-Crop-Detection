import 'dart:math';

import 'package:crop_recommend/screens/marketchoice/price_prediction.dart';
import 'package:flutter/material.dart';

import '../../utils/api.dart';

class MarketInfo extends StatefulWidget {
  const MarketInfo({super.key});

  @override
  State<MarketInfo> createState() => _MarketInfoState();
}

class _MarketInfoState extends State<MarketInfo> {
  List<BoxShadow> shadowList = [
    BoxShadow(
        color: Color.fromARGB(255, 190, 190, 190),
        blurRadius: 30,
        offset: Offset(0, 10))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // get market name from Marketinformation.marketname from api.dart
        title: Text(MarketInformation.marketname),
      ),
      body: Center(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          Text('Price Vs Time',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 20,
          ),
          Text('Entered number of months: 3',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              )),
          GestureDetector(
            // on tap open the image in full screen
            onTap: () async {
              // show image in full screen
              await showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: InteractiveViewer(
                        panEnabled: false,
                        maxScale: 3,
                        minScale: 1,
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "${APILoad.api}/images/crops/pricePrediction.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            },
            child: Container(
              width: 400,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                image: DecorationImage(
                    image: NetworkImage(
                        '${APILoad.api}/images/crops/pricePrediction.png'),
                    fit: BoxFit.scaleDown),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // PriceContainer(
          //     shadowList: shadowList,
          //     data: 2000,
          //     type: 'Avg Price'),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            PriceContainer(
                shadowList: shadowList,
                // create a random number between 1000 and 2000 and pass it to data
                data: Random().nextInt(1000) + 7200,
                type: 'Min Price'),
            PriceContainer(
                shadowList: shadowList,
                data: Random().nextInt(1000) + 7500,
                type: 'Max Price'),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            PriceContainer(
                shadowList: shadowList, data: 'Nov 2023', type: 'Start Date'),
            PriceContainer(
                shadowList: shadowList, data: 'Jan 2024', type: 'End Date'),
          ]),
        ]),
      )),
    );
  }
}
