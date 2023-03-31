import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EachAdvisory extends StatefulWidget {
  // create a variable to store the argument passed from the previous page.

  final String cropName;
  final String dasInAdvisory;
  const EachAdvisory({super.key,required this.cropName,required this.dasInAdvisory});

  @override
  State<EachAdvisory> createState() => _EachAdvisoryState();
}

class _EachAdvisoryState extends State<EachAdvisory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advisory'),
      ),
      body: Center(
        child: Container(
          child: Container(child: Text('${widget.dasInAdvisory}')),
        )
      ),
    );
  }
}