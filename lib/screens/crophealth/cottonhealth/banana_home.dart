import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
class BananaCropHome extends StatefulWidget {
  const BananaCropHome({super.key});

  @override
  State<BananaCropHome> createState() => _BananaCropHomeState();
}

class _BananaCropHomeState extends State<BananaCropHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banana'),
      ),
      body: const Center(
        child: Text('Banana'),
      ),
    );
  }
}