import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage(
    {Key? key,
    required this.bgimage
    }
    ) : super(key: key);
    final String bgimage;
  @override
  Widget build(BuildContext context) {
      return ShaderMask(
          shaderCallback: (rect) => const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Color.fromARGB(255, 18, 17, 17), Colors.transparent],
          ).createShader(rect),
          blendMode: BlendMode.darken,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/signup/login.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
              ),
            ),
          ),
        );
  }
}