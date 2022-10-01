import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CropChoice extends StatefulWidget {
  const CropChoice({Key? key}) : super(key: key);

  @override
  State<CropChoice> createState() => _CropChoiceState();
}

class _CropChoiceState extends State<CropChoice> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Crop Choice Page'),
      ),
    );
  }
}