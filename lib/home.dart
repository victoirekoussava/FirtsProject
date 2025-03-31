import 'package:flutter/material.dart';
import 'booking.dart';
import 'service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          // decoration: BoxDecoration(
          //   color: Colors.pink[200], // Couleur de fond
          //   borderRadius: BorderRadius.circular(20.0), // Bordures arrondies
          // ),

          child: Text(
            'Waly\'s Hair',
            style: TextStyle(
              color: Colors.pink[200],
              fontWeight: FontWeight.w500,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Bienvenue à Waly\'s hair',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  Service(
                    icon: Icons.cut, // Remplacez par l'icône souhaitée
                    serviceName: 'Tresses',
                    price: '80€',
                  ),
                  Service(
                    icon: Icons.color_lens, // Icône pour coloration
                    serviceName: 'Coloration',
                    price: '50€',
                  ),
                  Service(
                    icon: Icons.spa, // Icône pour soin capillaire
                    serviceName: 'Soin capillaire',
                    price: '40€',
                  ),
                  Service(
                    icon: Icons.handyman, // Icône pour manucure
                    serviceName: 'Manicure',
                    price: '10€',
                  ),
                  Service(
                    icon: Icons.access_time_rounded, // Icône pour manucure
                    serviceName: 'Pédicure',
                    price: '10€',
                  ),
                  Service(
                    icon: Icons.face, // Icône pour manucure
                    serviceName: 'Macillage',
                    price: '30€',
                  ),
                  Service(
                    icon: Icons.spa, // Icône pour manucure
                    serviceName: 'Soins de visage',
                    price: '35€',
                  ),
                ],
              ),
            ),

            Column(
              spacing: 16,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Booking()),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 45,
                      ),
                      backgroundColor: Colors.pink[200],
                    ),
                    child: Text(
                      'Prendre un rendez-vous',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,

                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Booking()),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 45,
                      ),
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.pink),
                    ),
                    child: Text(
                      'Liste de produits',
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  center({required FloatingActionButton floatingActionButton}) {}
}
