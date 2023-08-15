import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
    required this.hintText,
  }) : super(key: key);
  final String hintText;
  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics() ,
      child: Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    width: myWidth * .9,
                    decoration: BoxDecoration(
                      color: Colors.black45.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black54.withOpacity(.6),
                        ),
                        Expanded(
                            child: TextField(                            
                          decoration: InputDecoration(
                            hintText: hintText,
                            border: InputBorder.none,
                          ),
                        )),
                        // Icon(
                        //   Icons.mic,
                        //   color: Colors.black54.withOpacity(.6),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}