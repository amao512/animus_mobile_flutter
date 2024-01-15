import 'package:animus_mobile_flutter/app/router/route_helper.dart';
import 'package:animus_mobile_flutter/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animus_mobile_flutter/di/injection.dart' as inject;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await inject.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Animus',
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: AppTheme.appTheme,
      routerConfig: RouteHelper.getRouter(),
    );
  }
}
