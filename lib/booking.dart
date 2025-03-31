import 'package:flutter/material.dart';
import 'package:untitled/creatcompte.dart';
import 'package:untitled/listeusersname.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final TextEditingController _dateController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController serviceController = TextEditingController();

  List<DropdownMenuItem<String>> listservices = [];
  String? selectedService = 'coloration';
  List<Map<String, String>> appointments = [];
  List<Map<String, String>> users = [];

  @override
  void initState() {
    super.initState();
    _initServices();
  }

  void _initServices() {
    listservices = [
      DropdownMenuItem(
          value: 'Tresses',
          child: Text('Tresses',
              style: TextStyle(color: Colors.indigo[300], fontSize: 20))),
      DropdownMenuItem(
          value: 'coloration',
          child: Text('coloration',
              style: TextStyle(color: Colors.indigo[300], fontSize: 20))),
      DropdownMenuItem(
          value: 'Soins de cheveux',
          child: Text('Soins de cheveux',
              style: TextStyle(color: Colors.indigo[300], fontSize: 20))),
      DropdownMenuItem(
          value: 'pédicure',
          child: Text('pédicure',
              style: TextStyle(color: Colors.indigo[300], fontSize: 20))),
      DropdownMenuItem(
          value: 'manicure',
          child: Text('manicure',
              style: TextStyle(color: Colors.indigo[300], fontSize: 20))),
    ];
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(currentDate.year),
      lastDate: DateTime(currentDate.year, 12, 31),
    );

    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            color: Colors.pink[200],
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.all(18.0),
          child: const Text(
            'Prendre un rendez-vous',
            style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: selectedService,
                decoration: const InputDecoration(
                    labelText: 'Choisir un service',
                    labelStyle: TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                    border: OutlineInputBorder()
                ),
                items: listservices,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedService = value;
                    });
                  }
                },
                validator: (value) => value == null || value.isEmpty
                    ? 'Veuillez choisir un service'
                    : null,
              ),
              const SizedBox(height: 25),
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Date',
                  hintText: 'DD/MM/YYYY',
                  labelStyle: TextStyle(
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                  suffixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                onTap: () => _selectDate(context),
                validator: (value) =>
                value == null || value.isEmpty
                    ? 'Veuillez entrer une date'
                    : null,
              ),
              const SizedBox(height: 25),
              TextFormField(
                controller: prenomController,
                decoration: const InputDecoration(
                  labelText: 'Prénom',
                  labelStyle: TextStyle(
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre prénom';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              TextFormField(
                controller: numberController,
                decoration: InputDecoration(
                  labelText: 'Numéro de téléphone',
                  labelStyle: TextStyle(
                      color: Colors.pink[300],
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrer votre numéro de téléphone';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState != null && formKey.currentState!.validate()) {
                    // Ajouter une personne à la liste avec les bonnes informations
                    setState(() {
                      users.add({
                        "Prénom": prenomController.text,
                        "Numéro de téléphonne": numberController.text,
                        "Service": selectedService ?? '',
                        "Date": _dateController.text,
                      });

                      // Réinitialiser les champs après soumission
                      prenomController.clear();
                      numberController.clear();
                      _dateController.clear();
                    });

                    // Afficher un message de confirmation
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Rendez-vous réservé avec succès !'),
                      ),
                    );
                  } else {
                    // Afficher un message d'erreur
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Veuillez compléter tous les champs correctement'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink[200]),
                child: const Text('Valider votre rendez-vous'),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Listusersname(users: users),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
                    backgroundColor: Colors.pink[200]
                ),
                child: const Text('Creer un compte'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}