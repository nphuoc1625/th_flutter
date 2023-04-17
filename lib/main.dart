import 'package:flutter/material.dart';
import 'package:th_flutter/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:th_flutter/splashpage/splashpage.dart';
import 'firebase_options.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
    );
  }
}

// Future<void> initializeService() async {
//   final service = FlutterBackgroundService();
//   service.configure(
//       iosConfiguration: IosConfiguration(),
//       androidConfiguration: AndroidConfiguration(
//         onStart: onServiceStart,
//         isForegroundMode: false,
//         autoStart: false,
//       ));
//   service.startService();
// }

// void onServiceStart(ServiceInstance service) {
//   print("service started");

//   DatabaseReference ref = FirebaseDatabase.instance
//       .ref("user")
//       .child(FirebaseAuth.instance.currentUser!.uid)
//       .child("order");
//   ref.onValue.listen((event) {
//     if (event.type == DatabaseEventType.childChanged) {
//       print(event.snapshot.value);
//     }
//   });
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await initializeService();
}
