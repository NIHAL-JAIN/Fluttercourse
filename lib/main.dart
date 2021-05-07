import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/utils/Constraints.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Constants.prefs = await SharedPreferences.getInstance();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Awsome App",
      home: Constants.prefs.getBool("loggedIn")==true
          ?HomePage()
          :LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
       ),
       routes: {
    "/login":(context)=> LoginPage(),
    "/home" : (context)=> HomePage()
  },
  ),
  
  );
}

