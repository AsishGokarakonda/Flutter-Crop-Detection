import 'package:crop_recommend/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class WeatherSearchPage extends StatefulWidget {
  const WeatherSearchPage({super.key});

  @override
  State<WeatherSearchPage> createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        title:             const Text(
          'Pick location',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        toolbarHeight: 100,
      ),
        body: Container(
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
              height: myHeight * 0.1,
            ),
            //
          ]),
        ),
      ),
    );
  }
}
