import 'package:flutter/material.dart';

class FullWeatherReport extends StatefulWidget {
  final areaWeatherInfo;
  const FullWeatherReport({super.key, this.areaWeatherInfo});

  @override
  State<FullWeatherReport> createState() => _FullWeatherReportState();
}

class _FullWeatherReportState extends State<FullWeatherReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.areaWeatherInfo.cityName),
      ),
    );
  }
}
