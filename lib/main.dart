import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(SalonBookingApp());
}

class  SalonBookingApp extends StatelessWidget {
  const SalonBookingApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: Home(),
    );
}



