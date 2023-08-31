import 'package:crop_recommend/utils/useful_functions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/api.dart';
import 'full_weather_report.dart';

class EachAreaWeatherData extends StatefulWidget {
  final areaWeatherInfo;
  const EachAreaWeatherData({super.key, this.areaWeatherInfo});

  @override
  State<EachAreaWeatherData> createState() => _EachAreaWeatherDataState();
}

class _EachAreaWeatherDataState extends State<EachAreaWeatherData> {
  @override
  void initState() {
    super.initState();
    print(widget.areaWeatherInfo.temp);
    fetchTodayData( widget.areaWeatherInfo.latitude, widget.areaWeatherInfo.longitude );
  }

  Future<void> fetchTodayData(var latitude, var longitude) async {
    await WeatherData().getTodayWeatherData(latitude, longitude);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 14, 15, 42),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
              margin: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Center(
                      child: Container(
                    child: Text(
                      widget.areaWeatherInfo.cityName,
                      style: TextStyle(fontSize: 30, color: Colors.blue),
                    ),
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(convertDate(widget.areaWeatherInfo.date.toString()),
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white.withOpacity(0.6),
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      // child: Image.asset('assets/weather/day/293.png',scale: 0.25)
                      child: const FaIcon(
                        FontAwesomeIcons.cloudRain,
                        size: 200,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Text(widget.areaWeatherInfo.condition,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => FullWeatherReport(
                                areaWeatherInfo: widget.areaWeatherInfo
                                )),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Text('View full report',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                          ),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GradientBox(
                          placeholder: 'Temp',
                          value: '${widget.areaWeatherInfo.temp} °C',
                        ),
                        GradientBox(
                          placeholder: 'Humidity',
                          value: '${widget.areaWeatherInfo.humidity} %',
                        ),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GradientBox(
                        placeholder: 'Gust',
                        value: '${widget.areaWeatherInfo.gust} km/h',
                      ),
                      GradientBox(
                        placeholder: 'Pressure',
                        value: '${widget.areaWeatherInfo.pressure} mbar',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GradientBox(
                        placeholder: 'Wind',
                        value: '${widget.areaWeatherInfo.wind} km/h',
                      ),
                      GradientBox(
                        placeholder: 'Wind Direction',
                        value: '${widget.areaWeatherInfo.wind_dir} ',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GradientBox(
                        placeholder: 'UV Index',
                        value: '${widget.areaWeatherInfo.uv}',
                      ),
                      GradientBox(
                        placeholder: 'Precipitation',
                        value: '${widget.areaWeatherInfo.pricipe} mm',
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class GradientBox extends StatelessWidget {
  final String placeholder;
  final String value;
  const GradientBox({
    super.key,
    required this.placeholder,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 24, 97, 192),
            Color.fromARGB(255, 34, 154, 240),
          ]),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            placeholder,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          Text(value,
              style: TextStyle(
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
