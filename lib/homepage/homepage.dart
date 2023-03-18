import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:th_flutter/homepage/body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String routeName = "/homepage";
  @override
  Widget build(BuildContext context) {
    return const Body();
  }
}
