import "package:flutter/material.dart";
import 'package:quickaid/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'constants.dart';

class Createaccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Create your new account"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
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
          Center(
            child: Text(
              appName,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.deepPurpleAccent),
            ),
          ),
          Center(
            child: Text(
              slogan,
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent)),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.deepPurpleAccent,
                ),
                labelText: " NAME ",
                labelStyle:
                    TextStyle(color: Colors.deepPurpleAccent, fontSize: 17)),
          ),
          TextFormField(
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent)),
                prefixIcon: Icon(
                  Icons.person_search,
                  color: Colors.deepPurpleAccent,
                ),
                labelText: " GENDER",
                labelStyle:
                    TextStyle(color: Colors.deepPurpleAccent, fontSize: 17)),
          ),
          TextFormField(
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent)),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.deepPurpleAccent,
                ),
                labelText: " EMAIL ADDRESS ",
                labelStyle:
                    TextStyle(color: Colors.deepPurpleAccent, fontSize: 17)),
          ),
          TextFormField(
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent)),
                prefixIcon: Icon(
                  Icons.password,
                  color: Colors.deepPurpleAccent,
                ),
                labelText: " PASSWORD",
                labelStyle:
                    TextStyle(color: Colors.deepPurpleAccent, fontSize: 17)),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          SizedBox(
            height: height * 0.05,
            width: width * 0.85,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("CREATE THE ACCOUNT"),
              style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent),
            ),
          )
        ]),
      ),
    );
  }
}
