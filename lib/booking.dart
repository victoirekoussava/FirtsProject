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

  List<DropdownMenuItem<String>> listservices = [];
  String? selectedService;
  List<Map<String, String>> appointments = [];
  late String nameController;
  List<String> users=[];

  get validatedUsers => null;




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
          borderRadius: BorderRadius.circular(20.0), // Bordures arrondies
        ),
          padding: EdgeInsets.all(18.0),
          child: Text(
            'Prendre un rendez-vous',
            style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold),
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
                decoration: InputDecoration(labelText: 'Choisir un service',labelStyle: TextStyle(
                  color: Colors.pinkAccent,fontWeight: FontWeight.bold,fontSize: 20),
                  border: OutlineInputBorder()),
                items: listservices,
                onChanged: (value) {
                  setState(() {
                    selectedService = value!;
                  });
                },
              ),
              SizedBox(height: 25),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Date',
                  hintText: 'DD/MM/YYYY',
                  labelStyle: TextStyle(
                    color: Colors.pinkAccent,fontWeight: FontWeight.bold,fontSize: 20),
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
              SizedBox(height: 25),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Prénom',labelStyle: TextStyle(
                  color: Colors.pinkAccent,fontWeight: FontWeight.bold,fontSize: 20),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre prénom';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Numéro de téléphone',labelStyle: TextStyle(
                  color: Colors.pink[300],fontWeight: FontWeight.bold,fontSize: 20),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrer votre numéro de téléphone';
                  }
                  return null;
                },
              ),


              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // Ajouter une personne à la liste.
                    validatedUsers.add("Prénom");

                    // Afficher un message de confirmation.
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Rendez-vous réservé avec succès !'),
                      ),
                    );

                    // aller vers la page listepersonnes
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Listusersname(users: users) ,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink[200]),
                child: Text('Valider votre rendez-vous'),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  MyHomePage()),
                  );
                },

                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 45),
                    backgroundColor: Colors.pink[200]
                ),
                child: Text('Creer un compte'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}











