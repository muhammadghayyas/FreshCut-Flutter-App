import 'package:flutter/material.dart';
import 'booking_screen.dart';

class BarberDetailScreen extends StatelessWidget {

  final String name;
  final String experience;
  final String image;
  final String rating;

  const BarberDetailScreen({
    super.key,
    required this.name,
    required this.experience,
    required this.image,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Barber Details'),
      ),

      body: ListView(
        padding: EdgeInsets.all(20),

        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(15),

            child: Image.asset(
              image,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 20),

          Text(
            name,
            textAlign: TextAlign.center,

            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 5),

          Text(
            experience,
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Icon(Icons.star, color: Colors.amber),

              SizedBox(width: 5),

              Text('$rating Rating'),

            ],
          ),

          SizedBox(height: 25),

          Text(
            'About',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          Text(
            '$name is a professional barber specializing '
                'in modern haircuts and beard styling.',
            style: TextStyle(fontSize: 16),
          ),

          SizedBox(height: 25),

          Text(
            'Available Services',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          Card(
            child: ListTile(
              leading: Icon(Icons.content_cut),
              title: Text('Haircut'),
              subtitle: Text('30 Minutes'),
              trailing: Text('Rs. 400'),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.face),
              title: Text('Beard Trim'),
              subtitle: Text('20 Minutes'),
              trailing: Text('Rs. 200'),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.water_drop),
              title: Text('Hair Wash'),
              subtitle: Text('15 Minutes'),
              trailing: Text('Rs. 150'),
            ),
          ),

          SizedBox(height: 25),

          ElevatedButton(

            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookingScreen(
                    barberName: name,
                  ),
                ),
              );
            },

            child: Text('Book Appointment'),
          ),

        ],
      ),
    );
  }
}