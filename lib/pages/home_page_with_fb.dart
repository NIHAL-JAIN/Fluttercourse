import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/util/Constraints.dart';
import '../widgets/drawer.dart';
import 'package:http/http.dart' as http;

class HomePageFB extends StatefulWidget {
  @override
  _HomePageFBState createState() => _HomePageFBState();
}

class _HomePageFBState extends State<HomePageFB> {
  Future getData() async {
    Uri myUri = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    var res = await http.get(myUri);
    var data = jsonDecode(res.body);
    print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awsome App"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Constants.prefs.setBool("loggedIn", false);
                Navigator.pushReplacementNamed(context, "/login");
              })
        ],
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text("Fetch Something"),
                );
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Some Error Occured"),
                  );
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListTile(
                          title: Text(snapshot.data[index]["title"]),
                          subtitle: Text("ID : ${snapshot.data[index]["id"]}"),
                          leading: Image.network(snapshot.data[index]["url"])),
                    );
                  },
                  itemCount: snapshot.data.length,
                );
            }
          }),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // myText = _nameController.text;
          // setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
