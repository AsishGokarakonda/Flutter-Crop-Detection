import 'package:flutter/material.dart';

class CurvedButton extends StatelessWidget {
  const CurvedButton({
    Key? key,
    required this.buttonText,
  }) : super(key: key);
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 60.0,
      width: size.width * 0.85,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(255, 183, 159, 62)),
      child: TextButton(
          onPressed: () {},
          child: Text(
            buttonText,
            style: const TextStyle(
                color: Colors.white,
                height: 1.4,
                fontWeight: FontWeight.bold,
                fontSize: 17.0),
          )),
    );
  }
}