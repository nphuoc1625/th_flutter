import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:th_flutter/Model/notification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<MyNotification> notifications = [];
  getNoti() {
    String id = FirebaseAuth.instance.currentUser!.uid;
    FirebaseDatabase.instance.ref("user/$id/notification").get().then((value) =>
        {
          // ignore: avoid_function_literals_in_foreach_calls
          value.children.forEach((element) {
            MyNotification m =
                MyNotification.fromMap(element.value as Map<dynamic, dynamic>);
            m.id = element.key;
            if (mounted) setState(() => notifications.add(m));
          })
        });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getNoti();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      color: Colors.grey[200],
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 80,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color:
                    notifications[index].read ? Colors.white : Colors.grey[400],
              ),
              child: Text(notifications[index].title),
            ),
          ),
        ),
      ),
    );
  }
}
