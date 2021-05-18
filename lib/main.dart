import 'package:flutter/material.dart';
import 'package:thought_keeper/Constant.dart';
import 'HomePage.dart';
import 'Constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.appName,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Constant.background,
          accentColor: Constant.background,
          textTheme: TextTheme(bodyText2: TextStyle(color: Constant.textColor)),
      ),
      home: Scaffold(body: HomePage()),
    );
  }
}
