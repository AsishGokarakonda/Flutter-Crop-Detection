import 'package:crop_recommend/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/weather.dart';
import '../../utils/api.dart';
import 'each_area_weather.dart';

class WeatherSearchPage extends StatefulWidget {
  const WeatherSearchPage({super.key});

  @override
  State<WeatherSearchPage> createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage> {
  List<Weather> intialWeatherData = [];
  bool isLoading = true;
  int fetchedDataCount = 0;
  @override
  void initState() {
    fetchInitialWeatherData(12.9716, 77.5946);
    fetchInitialWeatherData(11.345, 16.2389);
    fetchInitialWeatherData(5.8081, 18.8901);
    fetchInitialWeatherData(6.1081, 17.8901);
    super.initState();
  }

  Future<void> fetchInitialWeatherData(var latitude, var longitude) async {
    Weather weatherData =
        await WeatherData().getCurrentWeatherData(latitude, longitude);
    setState(() {
      intialWeatherData.add(weatherData);
      fetchedDataCount++;
    });
    if (fetchedDataCount == 4) {
      setState(() {
        isLoading = false;
      });
    }
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
          backgroundColor: Colors.transparent,
          centerTitle: true,
          toolbarHeight: 100,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
              isLoading
                  ? Container(
                      height: myHeight * 0.5,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue ,
                        ),
                      ),
                    )
                  :
              Container(
                child: Column(children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: (intialWeatherData.length + 1) ~/
                        2, // Calculate number of rows needed
                    itemBuilder: (context, rowIndex) {
                      int startIndex = rowIndex * 2;
                      int endIndex = startIndex + 1;

                      // Check if endIndex exceeds the data length
                      if (endIndex >= intialWeatherData.length) {
                        endIndex = intialWeatherData.length - 1;
                      }

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TemperatureBox(
                              myHeight: myHeight,
                              myWidth: myWidth,
                              weatherData: intialWeatherData[startIndex]),
                          if (endIndex >=
                              startIndex +
                                  1) // Only build the second box if there's enough data
                            TemperatureBox(
                                myHeight: myHeight,
                                myWidth: myWidth,
                                weatherData: intialWeatherData[endIndex]),
                        ],
                      );
                    },
                  )
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
    required this.weatherData,
  });

  final double myHeight;
  final double myWidth;
  final Weather weatherData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => EachAreaWeatherData(
                    areaWeatherInfo: weatherData,
                  )),
        );
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
                      child: Column(children: [
                        Text(
                          // weatherData.temp.toString() limit this to
                          weatherData.temp.toString().length <= 7
                              ? '${weatherData.temp}°C'
                              : '${weatherData.temp.toString().substring(0, 3)}°C',
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          // width: 50 ,
                          child: Text(
                            // limit text to 8 characters
                            weatherData.condition.toString().length >= 8
                                ? '${weatherData.condition.toString().substring(0, 7)}...'
                                : weatherData.condition.toString(),
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withOpacity(0.6)),
                          ),
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
                  weatherData.cityName.toString().length >= 10
                      ? '${weatherData.cityName.toString().substring(0, 9)}...'
                      : weatherData.cityName.toString(),
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
