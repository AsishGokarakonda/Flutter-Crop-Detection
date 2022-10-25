import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PestHome extends StatefulWidget {
  const PestHome({Key? key}) : super(key: key);

  @override
  State<PestHome> createState() => _PestHomeState();
}

class _PestHomeState extends State<PestHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        title: const Text('Pest Management',style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              

              // make a rounded button and keep a image inside it and on press of that
              // button navigate to the detect disease page
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/detectdisease');
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.circular(20)),
                        child: const Icon(
                          Icons.pest_control,
                          color: Colors.black,
                          size: 70,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                       Text(
                        'Detect Disease',
                        style: TextStyle(color: Colors.red[300]),
                      )
                    ],
                  )),
                // make a rounded button and keep a image inside it and on press of that
                // button navigate to the detect disease page
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/yourcrops');
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(20)),
                        child: // keep image here and decrease size 
                         const Image(
                          image: AssetImage('assets/home/plantimg.png'),
                         ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Your Crops',
                        style: TextStyle(color: Colors.green[300]),
                      )
                    ],
                  )),
            ],)
          ])
        ,))
    );
  }
}