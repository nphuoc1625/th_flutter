import 'package:flutter/widgets.dart';
import 'package:th_flutter/homepage/components/search/searchpage_body.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return const SearchPageBody();
  }
}
