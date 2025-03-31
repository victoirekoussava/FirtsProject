import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  final IconData icon;
  final String serviceName;
  final String price;


  const Service({super.key, required this.icon, required this.serviceName, required this.price});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.purpleAccent), // Icône
        title: Text(serviceName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(price, style: TextStyle(fontSize: 16, color: Colors.green)),
      ),
    );
  }
}
