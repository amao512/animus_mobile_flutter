import 'package:alabs_flutter_core/core/ui/state/widget_state.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});


  @override
  State<StatefulWidget> createState() => _ProfileState();

}

class _ProfileState extends CoreWidgetState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profile"));
  }

}