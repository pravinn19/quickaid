import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Requestform extends StatefulWidget {
  @override
  _RequestformState createState() => _RequestformState();
}

class _RequestformState extends State<Requestform> {
  final _controllerName = TextEditingController();
  final _controllerNumber = TextEditingController();
  final _controllerCategory = TextEditingController();
  final _controllerItem = TextEditingController();
  final _controllerDuration = TextEditingController();

  void _saveTask() async {
    if (_formkey.currentState!.validate()) {
      final taskName = _controllerName.text;
      final taskNumber = _controllerNumber.text;
      final taskCategory = _controllerCategory.text;
      final taskItem = _controllerItem.text;
      final taskDuration = _controllerDuration.text;

      FirebaseFirestore.instance.collection("Datum").add({
        "Name": taskName,
        "PNumber": taskNumber,
        "Category": taskCategory,
        "Item": taskItem,
        "Duration": taskDuration,
        "Server": FieldValue.serverTimestamp(),
        "ID": FieldValue.increment(1)
      });
      // _controllerName.clear();
      // _controllerNumber.clear();
      // _controllerCategory.clear();
      // _controllerItem.clear();
      // _controllerDuration.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Fields can't be empty"),
      ));
    }
  }

  String? _Name;
  String? _Phone_number;
  String? _Category;
  String? _Item;
  String? _Duration;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  _buildName() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: _controllerName,
        decoration: InputDecoration(labelText: 'Name'),
        validator: (String? Value) {
          if (Value!.isEmpty) {
            return 'Name is Required';
          }
        },
        onSaved: (String? Value) {
          _Name = Value!;
        },
      ),
    );
  }

  Widget _buildPhone_number() {
    return TextFormField(
      controller: _controllerNumber,
      decoration: InputDecoration(labelText: 'Phone number'),
      maxLength: 10,
      keyboardType: TextInputType.phone,
      validator: (String? Value) {
        if (Value!.isEmpty) {
          return 'Phone number is Required';
        }
      },
      onSaved: (String? Value) {
        _Phone_number = Value!;
      },
    );
  }

  Widget _buildcategory() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: _controllerCategory,
        decoration: InputDecoration(
            labelText: 'what category does the item belongs to?'),
        validator: (String? Value) {
          if (Value!.isEmpty) {
            return 'Category is Required';
          }
        },
        onSaved: (String? Value) {
          _Category = Value!;
        },
      ),
    );
  }

  Widget _buildItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: _controllerItem,
        decoration: InputDecoration(labelText: 'Name of the Item'),
        validator: (String? Value) {
          if (Value!.isEmpty) {
            return 'Item name is Required';
          }
        },
        onSaved: (String? Value) {
          _Item = Value!;
        },
      ),
    );
  }

  Widget _buildDuration() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: _controllerDuration,
        decoration: InputDecoration(labelText: 'Lending time (Min/ Hours)'),
        keyboardType: TextInputType.number,
        validator: (String? Value) {
          if (Value!.isEmpty) {
            return 'Duration is Required';
          }
        },
        onSaved: (String? Value) {
          _Duration = Value!;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Request Form"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildName(),
                    _buildPhone_number(),
                    _buildcategory(),
                    _buildItem(),
                    _buildDuration(),
                    SizedBox(
                      height: 70,
                    ),
                    SizedBox(
                      height: height * 0.08,
                      width: width * 0.6,
                      child: ElevatedButton(
                        onPressed: () {
                          _saveTask();
                          if (!_formkey.currentState!.validate()) {
                            return;
                          }

                          _formkey.currentState!.save();

                          // print(_Name);
                          // print(_Phone_number);
                          // print(_Category);
                          // print(_Item);
                          // print(_Duration);
                        },
                        child: Text('Submit'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurpleAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60))),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
