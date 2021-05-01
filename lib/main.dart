import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Awsome App",
    home: HomePage(),
  ));
}
class  HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Awsome App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomRight,
                  child: Container(
            color: Colors.blue,
            width: 200,
            height: 400, 
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                     Container(
                padding: const EdgeInsets.all(8),
                width: 100,
                height: 100,
                color: Colors.red,
               
              ),
               Container(
                padding: const EdgeInsets.all(8),
                width: 100,
                height: 100,
                color: Colors.green,
               
              ),
               Container(
                padding: const EdgeInsets.all(8),
                width: 100,
                height: 100,
                color: Colors.blue,
               
              ),
                ],
              ),
                  ),
          ),
        ),
      ),
      );
    
    
  }
}
