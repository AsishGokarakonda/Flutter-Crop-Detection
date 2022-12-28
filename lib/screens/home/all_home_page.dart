import 'package:flutter/material.dart';

class AllHomePage extends StatefulWidget {
  const AllHomePage({Key? key}) : super(key: key);

  @override
  State<AllHomePage> createState() => _AllHomePageState();
}

class _AllHomePageState extends State<AllHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: // make background transparent
            AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // center title
          centerTitle: true,
          // caption below title

          title: Column(children: const [
            SizedBox(
              height: 10,
            ),
            Text(
              'Kisan Suvidha ',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'A Smart App',
              style: TextStyle(color: Colors.black38, fontSize: 12),
            ),
          ]),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            Row(
                // space between the two buttons
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // create a rounded button and keep a image inside it and on press of that
                  TextButton(
                      onPressed: () {
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'assets/home/cropchoice.png',
                              height: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Crop Choice',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      )),
                  TextButton(
                      onPressed: () {
                        // go to Profile page
                        Navigator.pushNamed(context, '/profile');
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'assets/home/dashboard.png',
                              height: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Your Dashboard',
                              style: TextStyle(color: Colors.black))
                        ],
                      )),
                ]),
            const SizedBox(
              height: 15,
            ),
            Row(
                // space between the two buttons
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // create a rounded button and keep a image inside it and on press of that
        
                  TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'assets/home/crophealth.png',
                              height: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Crop Health',
                              style: TextStyle(color: Colors.black))
                        ],
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'assets/home/weed.png',
                              height: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Weed Management',
                              style: TextStyle(color: Colors.black))
                        ],
                      )),
                ]),
            const SizedBox(
              height: 15,
            ),
            Row(
                // space between the two buttons
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // create a rounded button and keep a image inside it and on press of that
        
                  TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'assets/home/market.png',
                              height: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Market Choice',
                              style: TextStyle(color: Colors.black))
                        ],
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/pesthome');},
                      child: Column(
                        children: [
                          SizedBox(
                            width: 80,
                            height: 100,
                            child: Image.asset(
                              'assets/home/pest.png',
                              height: 80,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Pest Management',
                              style: TextStyle(color: Colors.black))
                        ],
                      )),
                ]),
          ]),
        ));
  }
}
