import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CropHealth extends StatefulWidget {
  const CropHealth({Key? key}) : super(key: key);

  @override
  State<CropHealth> createState() => _CropHealthState();
}

class _CropHealthState extends State<CropHealth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Crop Health Page'),
      ),
    );
  }
}