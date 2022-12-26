import 'package:flutter/material.dart';
class AddField extends StatefulWidget {
  const AddField({super.key});

  @override
  State<AddField> createState() => _AddFieldState();
}

class _AddFieldState extends State<AddField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Field'),
      ),
      body: const Center(
        child: Text('Add Field'),
      )
    );
  }
}