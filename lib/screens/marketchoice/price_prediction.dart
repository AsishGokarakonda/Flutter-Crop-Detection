import 'package:crop_recommend/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

class PricePredict extends StatefulWidget {
  const PricePredict({super.key});

  @override
  State<PricePredict> createState() => _PricePredictState();
}

class _PricePredictState extends State<PricePredict> {
  List<BoxShadow> shadowList = [
    BoxShadow(
        color: Color.fromARGB(255, 190, 190, 190),
        blurRadius: 30,
        offset: Offset(0, 10))
  ];

  double min_price = 0.0;
  double max_price = 0.0;
  double avg_price = 0.0;
  String start = '';
  String end = '';
  int showgraph = 0;
  int months = 0;
  int buffering = 0;
  String imagestring = '';
  // create an array of market names
  List<String> marketnames = [];
  LocationData? locationData;

  static double latitude = 0.0;
  static double longitude = 0.0;

  static TextEditingController latitudeController = TextEditingController();
  static TextEditingController longitudeController = TextEditingController();

  void getPermission() async {
    if (await Permission.location.isGranted) {
      // Get location
      getLocation();
    } else {
      // Request permission
      Permission.location.request();
    }
  }

  void getLocation() async {
     setState(() {
      buffering = 1;
    });
    locationData = await Location.instance.getLocation();
    setState(() {
      buffering = 0;
      latitude = locationData!.latitude!;
      longitude = locationData!.longitude!;
      latitudeController.text = latitude.toString();
      longitudeController.text = longitude.toString();
    });
    print(latitude);
    print(longitude);
  }

  void getpriceprediction() async {
    var request = await http.post(
        Uri.parse('${APILoad.api}/marketchoice/predictmarketprice/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({"months": months}));
    var data = json.decode(request.body);
    min_price = data['min_price'];
    max_price = data['max_price'];
    avg_price = data['avg_price'];
    start = data['start'];
    end = data['end'];
    print(data);
    setState(() {
      showgraph = 1;
      buffering = 0;
    });
  }

  Future<List> getnearestmarkets() async {
    // get latitute and longitude of the user
    setState(() {
      buffering = 1;
    });
    locationData = await Location.instance.getLocation();
    setState(() {
      buffering = 0;
      latitude = locationData!.latitude!;
      longitude = locationData!.longitude!;
      latitudeController.text = latitude.toString();
      longitudeController.text = longitude.toString();
    });
    var request = await http.get(
      Uri.parse('${APILoad.api}/marketchoice/getnearestmarkets/'),
      headers: {
        'Accept': 'application/json',
        'latitude': locationData!.latitude!.toString(),
        'longitude': locationData!.longitude!.toString(),
      },
    );
    var data = json.decode(request.body);
    print(data);
    for (var i = 0; i < data.length; i++) {
      marketnames.add(data[i]['name']);
    }
    setState(() {
      buffering = 0;
    });
    print(marketnames);
    return marketnames;
  }

  late Future<List> _markets;
  @override
  void initState() {
    _markets = getnearestmarkets();
    print('hi');
    print(_markets);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.black54,
                elevation: 0,
                expandedHeight: 200.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    // keep title at top
                    title: Text('Market choice',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                        )),
                    background: Image.asset(
                      'assets/marketchoice/pricePredictHome.jpg',
                      colorBlendMode: BlendMode.darken,
                      color: Colors.black.withOpacity(0.25),
                      fit: BoxFit.cover,
                    )),
              ),
            ];
          },
          body: buffering == 0
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        // width: 300,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          'Enter the number of months you want to predict the price for',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      // width: 300,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        // input should be a number
                        onChanged: (value) {
                          months = int.parse(value);
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Number of months',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        // call the function getpriceprediction()
                        // keep rotating circle until the data is fetched
                        setState(() {
                          buffering = 1;
                        });
                        getpriceprediction();
                        setState(() {
                          // update the network image
                          imagestring =
                              "${APILoad.api}/images/crops/pricePrediction.png";
                          
                        });
                      },
                      child: Text(
                        'Predict',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          backgroundColor: Colors.green,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // if showgraph is 1 then show text graph

                    showgraph == 1
                        ? Container(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                                'Price prediction is completed. Go to each market to see price!',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green)),
                          )
                        : Container(),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Available Markets',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    FutureBuilder(
                        future: _markets,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.data == null) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else {
                            return ListView.builder(
                              itemBuilder: (context, index) {
                                return MarketCard(
                                  marketname: snapshot.data[index],
                                  bgimage: snapshot.data[index],
                                );
                              },
                              itemCount: snapshot.data.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                            );
                          }
                        }),
                  ]),
                )
              : Container(
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )),
    );
  }
}

class PriceContainer extends StatelessWidget {
  PriceContainer({
    Key? key,
    required this.shadowList,
    required this.data,
    required this.type,
  }) : super(key: key);

  final List<BoxShadow> shadowList;
  final data;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: shadowList),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Text(
                  '$type',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  // if type of data is double then show rupees symbol and if type of data is date then show date
                  type == 'Start Date' || type == 'End Date' ? data : '₹ $data',
                  style: TextStyle(
                    color: // if type is min price then show red and if type is avg price then show green and if type is max price then show blue
                        type == 'Min Price'
                            ? Colors.red
                            : type == 'Avg Price'
                                ? Colors.blue
                                : type == 'Max Price'
                                    ? Colors.green
                                    : Color.fromARGB(255, 248, 183, 18),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MarketCard extends StatelessWidget {
  const MarketCard({super.key, this.marketname, this.ontap, this.bgimage});
  final marketname;
  final ontap;
  final bgimage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MarketInformation.marketname = marketname;
        Navigator.pushNamed(context, '/marketinfo');
      },
      child: Container(
        height: 180,
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(
              'assets/marketchoice/market1.jpg',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.darken),
          ),
        ),
        child: Container(
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.all(10),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                child: Text(
                  marketname,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ])),
      ),
    );
  }
}
