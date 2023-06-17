import 'package:flutter/material.dart';


class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<String> notifications = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: notifications.isNotEmpty
          ? ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(notifications[index]),
            onTap: () {
              // Handle notification tap
              print('Notification tapped: ${notifications[index]}');
            },
          );
        },
      )
          : Center(
        child: Text(
          'No notifications',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
