import 'package:flutter/material.dart';

class Listusersname extends StatelessWidget {
  final List<String> users;

  Listusersname({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des rendez-vous validés'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index]),
          );
        },
      ),
    );
  }
}
