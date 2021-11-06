import 'package:flutter/material.dart';

import 'constants.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Joe mama"),
              accountEmail: Text("JoeFelix@Quickaid.com"),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: Text('Request an item'),
              leading: Icon(Icons.delivery_dining),
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: Text('Maps'),
              leading: Icon(Icons.map),
            ),
            Divider(
              height: 0.1,
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                bgimage,
                height: height * 0.30,
                width: width,
                fit: BoxFit.cover,
              ),
              Container(
                height: height * 0.35,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      stops: [0.5, 0.9],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.white]),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 8),
            child: Center(
              child: Card(
                color: Colors.deepPurple,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Container(
                  height: 100,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
