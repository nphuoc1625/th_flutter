class MyNotification {
  String? id;
  String title;
  bool read;
  DateTime time;
  MyNotification(this.title, this.time, this.read);

  factory MyNotification.fromMap(Map<dynamic, dynamic> map) {
    return MyNotification(
        map['title'], DateTime.parse(map['time']), map['read']);
  }
}
