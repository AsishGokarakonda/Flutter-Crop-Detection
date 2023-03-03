import 'package:flutter/material.dart';

class CottonCropHome extends StatefulWidget {
  const CottonCropHome({super.key});

  @override
  State<CottonCropHome> createState() => _CottonCropHomeState();
}

class _CottonCropHomeState extends State<CottonCropHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cotton'),
      ),
      body: const Center(
        child: Text('Cotton'),
      ),
    );
  }
}