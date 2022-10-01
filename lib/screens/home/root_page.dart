import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    Size size = MediaQuery.of(context).size;
    
    List<String> _plantTypes =[
      'Recommended',
      'Indoor',
      'Outdoor',
      'Garden',
      'Supplement'
    ];


    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                     Container(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  width: size.width * .9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black54.withOpacity(.6),
                      ),
                      const Expanded(
                          child: TextField(
                        showCursor: false,
                        decoration: InputDecoration(
                          hintText: 'Search Plant',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      )),
                      // Icon(
                      //   Icons.mic,
                      //   color: Colors.black54.withOpacity(.6),
                      // ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black45.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                )
              ],
            ),
          ),
          ],
        )
      ),
    );
  }
}