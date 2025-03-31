import 'package:flutter/material.dart';

class Listusersname extends StatelessWidget {
  final List<Map<String, String>> users;

  const Listusersname({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Vérification en cas de liste vide
    if (users.isEmpty) {
      return const Center(
        child: Text(
          'Aucun rendez-vous pour le moment',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        // Utilisation de l'opérateur ?? pour éviter les valeurs null
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          elevation: 3,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pink[100],
              child: Text(
                (user["Prénom"] ?? "").isNotEmpty ? (user["Prénom"] ?? "")[0].toUpperCase() : "?",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(user["Prénom"] ?? ""),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Téléphone: ${user["Numéro de téléphonne"] ?? ""}"),
                Text("Service: ${user["Service"] ?? ""}"),
                Text("Date: ${user["Date"] ?? ""}"),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Cette partie pourrait être améliorée avec une callback
                // pour supprimer l'élément, mais cela nécessiterait de passer
                // une fonction du widget parent
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Fonctionnalité de suppression à implémenter'),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}