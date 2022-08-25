import 'package:flutter/material.dart';
import 'package:to_do/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   textTheme: GoogleFonts.nunitoSansTextTheme(
      //     Theme.of(context).textTheme
      //   )
      // ),
      home: Homepage()
    );
  }
}
