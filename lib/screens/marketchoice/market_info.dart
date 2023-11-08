import 'package:flutter/material.dart';

import '../../utils/api.dart';

class MarketInfo extends StatefulWidget {
  const MarketInfo({super.key});

  @override
  State<MarketInfo> createState() => _MarketInfoState();
}

class _MarketInfoState extends State<MarketInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // get market name from Marketinformation.marketname from api.dart
        title: Text(MarketInformation.marketname),
      ),
      body: Center(
        child: Text('Market Info'),
      ),
    );
  }
}