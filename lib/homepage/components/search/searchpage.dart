import 'package:flutter/widgets.dart';
import 'package:th_flutter/Model/product.dart';
import 'package:th_flutter/homepage/components/search/searchpage_body.dart';

import '../../../Model/store.dart';

class SearchPage extends StatefulWidget {
  const SearchPage(this.result, {super.key});
  final List<dynamic> result;
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SearchPageBody(widget.result);
  }
}
