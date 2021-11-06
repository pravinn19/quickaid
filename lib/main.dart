import 'package:flutter/material.dart';
import 'package:quickaid/create_account.dart';
import 'package:quickaid/home_screen.dart';
import 'package:quickaid/request_form.dart';
import 'constants.dart';
import 'login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(InitialScreen());
}

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Requestform(),
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(backgroundColor: Colors.deepPurpleAccent),
          accentColor: Colors.deepPurpleAccent,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: GoogleFonts.montserratTextTheme()),
    );
  }
}
