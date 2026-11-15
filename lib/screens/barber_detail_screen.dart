import 'package:flutter/material.dart';
import 'booking_screen.dart';

class BarberDetailScreen extends StatelessWidget {

  final String name;
  final String experience;
  final String image;

  const BarberDetailScreen({
    super.key,
    required this.name,
    required this.experience,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barber Details'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: ListView(
        padding: EdgeInsets.all(20),
        children: [


          Image.asset(
            image,
            height: 220,
            width: 100,
            fit: BoxFit.contain,
          ),


          SizedBox(height: 20),

          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          Text(
            experience,
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 10),

          Text(
            'Professional Barber',
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 30),

          Text(
            'Available Services',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 15),

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
