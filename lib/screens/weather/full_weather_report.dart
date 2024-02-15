import 'package:crop_recommend/screens/weather/each_area_weather.dart';
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Today', style: TextStyle(
                          // fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),), Text('November 16', style: TextStyle(
                          // fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ))],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                GradientBox(placeholder: '9:00 pm', value: '29°C'),
                GradientBox(placeholder: '10:00 pm', value: '27°C'),
                GradientBox(placeholder: '11:00 pm', value: '27°C'),
                GradientBox(placeholder: '12:00 pm', value: '26°C'),
              ]),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(15),
              child: Column(children: [
                Container(
                  child: Column(

                    children: [
                    Text('Next forecast',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ]),
                ),
                Container(
                  height: 100,
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
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Friday',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text('17 November',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      Text('29°C',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/weather/day/293.png', scale: 1),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
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
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Saturday',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text('18 November',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      Text('30°C',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/weather/day/293.png', scale: 1),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
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
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sunday',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text('19 November',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      Text('29°C',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/weather/day/293.png', scale: 1),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
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
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Monday',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text('20 November',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      Text('28°C',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/weather/day/293.png', scale: 1),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
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
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Tuesday',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text('21 November',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      Text('28°C',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/weather/day/293.png', scale: 1),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
