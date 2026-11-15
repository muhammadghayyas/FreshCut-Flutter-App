import 'package:flutter/material.dart';
import 'barbers_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FreshCut'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: ListView(
        padding: EdgeInsets.all(20),
        children: [

          Image.asset(
            'assets/images/logo.png',
            height: 90,
            width: 90,
          ),

          SizedBox(height: 15),

          Text(
            'Welcome to FreshCut',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          Text(
            'Great Hair. Better You.',
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 20),

          Image.asset(
            'assets/images/banner.png',
            height: 200,
            fit: BoxFit.cover,
          ),

          SizedBox(height: 20),

          Text(
            'Book your haircut with ease!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          Text(
            'Choose your favorite barber and book an appointment.',
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 25),

          Text(
            'Our Services',
            textAlign: TextAlign.center,
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
              trailing: Text('Rs. 400'),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.face),
              title: Text('Beard Trim'),
              trailing: Text('Rs. 200'),
            ),
          ),

          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BarbersScreen(),
                ),
              );
            },
            child: Text('Explore Barbers'),
          ),

        ],
      ),
    );
  }
}
