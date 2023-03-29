import 'package:flutter/material.dart';
import '../../../utils/notification_api.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
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
      body: Center(
        child: TextButton(onPressed: () async {
           await NotificationService.showNotification(
                  title: "Title of the notification",
                  body: "Body of the notification",
                );
        }, child: Text('Cotton')),
      ),
    );
  }
}