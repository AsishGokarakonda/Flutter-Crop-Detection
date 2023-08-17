import 'package:crop_recommend/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/weather.dart';
import '../../utils/api.dart';

class WeatherSearchPage extends StatefulWidget {
  const WeatherSearchPage({super.key});

  @override
  State<WeatherSearchPage> createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage> {
  List <Weather> intialWeatherData=[];
    @override
  void initState() {

    // get the weather data from the WeatherData().getCurrentWeatherData for some 2 cities of random latitude,longitude and store it in the list IntialWeatherData
    fetchInitialWeatherData();
    super.initState();
  }
  Future<void> fetchInitialWeatherData() async {
    Weather weatherData = await WeatherData().getCurrentWeatherData(12.9716, 77.5946);
    setState(() {
      intialWeatherData.add(weatherData);
    });
    print(intialWeatherData);
  }
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Pick location',
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.transparent ,
          centerTitle: true,
          toolbarHeight: 100,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics() ,
          child: Container(
            child: Column(children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: myWidth * 0.1),
                  child: Column(
                    children: [
                      Text(
                        'Select the city that you want to know',
                        style: TextStyle(
                            fontSize: 15, color: Colors.black.withOpacity(0.5)),
                      ),
                      Text(
                        'the detailed weather info',
                        style: TextStyle(
                            fontSize: 15, color: Colors.black.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
              ),
              CustomSearchBar(hintText: 'Search city name'),
              SizedBox(
                height: myHeight * 0.05,
              ),
        
              Container(
                // margin: EdgeInsets.symmetric(horizontal: myWidth * 0.02),
                // padding: EdgeInsets.symmetric(horizontal: myWidth * 0.0) ,
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TemperatureBox(myHeight: myHeight, myWidth: myWidth),
                        TemperatureBox(myHeight: myHeight, myWidth: myWidth),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TemperatureBox(myHeight: myHeight, myWidth: myWidth),
                        TemperatureBox(myHeight: myHeight, myWidth: myWidth),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TemperatureBox(myHeight: myHeight, myWidth: myWidth),
                        TemperatureBox(myHeight: myHeight, myWidth: myWidth),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TemperatureBox(myHeight: myHeight, myWidth: myWidth),
                        TemperatureBox(myHeight: myHeight, myWidth: myWidth),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TemperatureBox(myHeight: myHeight, myWidth: myWidth),
                        TemperatureBox(myHeight: myHeight, myWidth: myWidth),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TemperatureBox(myHeight: myHeight, myWidth: myWidth),
                        TemperatureBox(myHeight: myHeight, myWidth: myWidth),
                      ]),
                ]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class TemperatureBox extends StatelessWidget {
  const TemperatureBox({
    super.key,
    required this.myHeight,
    required this.myWidth,
  });

  final double myHeight;
  final double myWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => WeatherPage()));
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: myHeight * 0.18,
            width: myWidth * 0.4,
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                          children: [
                            Text(
                              '25°C',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              // limit text to 8 characters
                              'Cloudy',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.6)),
                            ),
                          ]),
                    ),
    
                    // const Icon(
                    //       Icons.cloud,
                    //       size: 40,
                    //       color: Colors.white,
                    //     )
    
                    FaIcon(
                      FontAwesomeIcons.cloudRain,
                      color: Colors.white,
                      size: 40,
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  //limit text to some chars
                  'Kathmandu',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
