import 'package:flutter/material.dart';
import 'package:quickaid/request_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Requestform())),
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
        body:
            //  Column(
            //   children: [
            //     Stack(
            //       children: [
            //         Image.asset(
            //           bgimage,
            //           height: height * 0.30,
            //           width: width,
            //           fit: BoxFit.cover,
            //         ),
            //         Container(
            //           height: height * 0.35,
            //           width: width,
            //           decoration: BoxDecoration(
            //             gradient: LinearGradient(
            //                 stops: [0.5, 0.9],
            //                 begin: Alignment.topCenter,
            //                 end: Alignment.bottomCenter,
            //                 colors: [Colors.transparent, Colors.white]),
            //           ),
            //         ),
            //       ],
            //     ),

            StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Datum")
              .orderBy('Server')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                // Map<String, dynamic> data =
                //     document.data()! as Map<String, dynamic>;
                Text("Request section");
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      color: Colors.deepPurple,
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Container(
                        height: 80,
                        child: Center(
                          child: Text(
                            document['Item'],
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      )),
                );
              }).toList(),
            );
          },
        )
        //   ],
        // ),
        );
  }
}
