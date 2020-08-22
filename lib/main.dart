import 'package:GOP_MOBILE_APP/global_conf.dart';
import 'package:GOP_MOBILE_APP/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global Online Pay',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: HomeScreen(),
    );
  }
}
