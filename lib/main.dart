import 'package:flutter/material.dart';
import 'package:flutter_apps/FormHome.dart';
import 'package:flutter_apps/Home.dart';
import 'package:flutter_apps/SampleCode.dart';
import 'package:flutter_apps/validationData.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Application",
      home: MyAppli(),
    );
  }
}

