import 'package:crop_recommend/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
  // {
  // "min_price": 5270.0,
  // "max_price": 10450.0,
  // "avg_price": 7860.0,
  // "start": "Mar 2023",
  // "end": "Dec 2023"
// }
  // create variables for min_price, max_price, avg_price, start, end

  double min_price = 0.0;
  double max_price = 0.0;
  double avg_price = 0.0;
  String start = '';
  String end = '';
  int showgraph = 0;
  int months = 0;
  int buffering = 0;
  String imagestring ='';
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

  @override
  void initState() {
    // getpriceprediction();
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
                          imagestring = "${APILoad.api}/images/crops/pricePrediction.png";
                        });
                      },
                      child: Text(
                        '  Predict  ',
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
                        ? Column(children: [
                            Text('Price Vs Time',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold, 
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                                                        Text('Entered number of months: $months',
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
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20),
                                                      topRight:
                                                          Radius.circular(20),
                                                      bottomLeft:
                                                          Radius.circular(20),
                                                      bottomRight:
                                                          Radius.circular(20)),
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
                                      imagestring
                                        ),
                                    fit: BoxFit.scaleDown
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            PriceContainer(
                                shadowList: shadowList,
                                data: avg_price,
                                type: 'Avg Price'),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  PriceContainer(
                                      shadowList: shadowList,
                                      data: min_price,
                                      type: 'Min Price'),
                                  PriceContainer(
                                      shadowList: shadowList,
                                      data: max_price,
                                      type: 'Max Price'),
                                ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  PriceContainer(
                                      shadowList: shadowList,
                                      data: start,
                                      type: 'Start Date'),
                                  PriceContainer(
                                      shadowList: shadowList,
                                      data: end,
                                      type: 'End Date'),
                                ]),
                          ])
                        : Container(),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Markets',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold, 
                        )
                        ),
                        MarketCard(
                          marketname: 'Dharwad market',
                          bgimage: 'market1',
                        ),
                        MarketCard(
                          marketname: 'Fresh veggies',
                          bgimage: 'market2',
                        ),
                        MarketCard(
                          marketname: 'Mr. Herbs',
                          bgimage: 'market3',
                        ),
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
          margin: const EdgeInsets.symmetric(vertical: 10) ,
          child: Column(
            children: [
        Text(
            '$type',
            style: TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            // if type of data is double then show rupees symbol and if type of data is date then show date
            type == 'Start Date' || type == 'End Date'
                ? data
                : '₹ $data',
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
  const MarketCard({
    super.key,
    this.marketname,
    this.ontap,
    this.bgimage
  });
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
              'assets/marketchoice/$bgimage.jpg',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.darken),
          ),
        ),
        child: Container(
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
