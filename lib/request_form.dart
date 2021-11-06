import 'package:flutter/material.dart';

class Requestform extends StatefulWidget {
  @override
  _RequestformState createState() => _RequestformState();
}

class _RequestformState extends State<Requestform> {
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
        decoration: InputDecoration(labelText: 'Category'),
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
        decoration: InputDecoration(labelText: 'Item'),
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
        decoration: InputDecoration(labelText: 'Duration'),
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
                      height: 100,
                    ),
                    SizedBox(
                      height: height * 0.08,
                      width: width * 0.6,
                      child: ElevatedButton(
                        onPressed: () {
                          if (!_formkey.currentState!.validate()) {
                            return;
                          }

                          _formkey.currentState!.save();

                          print(_Name);
                          print(_Phone_number);
                          print(_Category);
                          print(_Item);
                          print(_Duration);
                        },
                        child: Text('Submit'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurpleAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
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
