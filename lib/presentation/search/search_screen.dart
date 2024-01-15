import 'package:alabs_flutter_core/core/ui/state/widget_state.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});


  @override
  State<StatefulWidget> createState() => _SearchState();

}

class _SearchState extends CoreWidgetState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Search"));
  }

}