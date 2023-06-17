import 'package:flutter/material.dart';
import 'package:she_banks/screens/home_notifier.dart';

class NotificationDetailsPage extends StatelessWidget {
  final String notification;

  NotificationDetailsPage({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Details'),
      ),
      body: Center(
        child: Text(notification),
      ),
    );
  }
}
