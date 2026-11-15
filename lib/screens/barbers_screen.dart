import 'package:flutter/material.dart';
import 'barber_detail_screen.dart';

class BarbersScreen extends StatelessWidget {
  const BarbersScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final names = [
      'Khalil',
      'Ahmed',
      'Sunain',
    ];

    final experience = [
      '5 Years Experience',
      '3 Years Experience',
      '4 Years Experience',
    ];

    final images = [
      'assets/images/barber1.jpg',
      'assets/images/barber2.jpg',
      'assets/images/barber3.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Our Barbers'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: ListView.builder(
        itemCount: names.length,

        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),

            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(images[index]),
              ),

              title: Text(names[index]),

              subtitle: Text(experience[index]),

              trailing: Icon(Icons.arrow_forward),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BarberDetailScreen(
                      name: names[index],
                      experience: experience[index],
                      image: images[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
