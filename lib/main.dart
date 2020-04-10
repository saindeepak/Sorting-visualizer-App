import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sortingalgorithms_visualizer/services/providernotifer.dart';
import 'package:sortingalgorithms_visualizer/screens/home.dart';
import 'package:sortingalgorithms_visualizer/screens/landinginfo.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UpdateLength(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
      routes: {
        '/visualizer': (context) => Home(),
      }
    );
  }
}



