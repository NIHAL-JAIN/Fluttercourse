import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';


void main() {
  runApp(
    MaterialApp(
      title: "Awsome App",
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
       ),
  ),
  );
}

