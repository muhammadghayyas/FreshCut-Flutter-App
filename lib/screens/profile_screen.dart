import 'package:flutter/material.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});


  void showMessage(BuildContext context, String message) {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return ListView(
      padding: EdgeInsets.all(20),

      children: [

        SizedBox(height: 20),

        CircleAvatar(
          radius: 50,
          backgroundColor: Color(0xFFE4F0EA),

          child: Icon(
            Icons.person,
            size: 65,
            color: Color(0xFF205E50),
          ),
        ),

        SizedBox(height: 15),

        Text(
          'Muhammad Ghayyas',
          textAlign: TextAlign.center,

          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          'muhammadghayyas5941@email.com',
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 30),

        Card(
          child: ListTile(

            leading: Icon(Icons.person),
            title: Text('Personal Information'),
            trailing: Icon(Icons.chevron_right),

            onTap: () {

              showDialog(
                context: context,

                builder: (context) => AlertDialog(

                  title: Text('Personal Information'),

                  content: Text(
                    'Name: Muhammad Ghayyas\n'
                        'Email: muhammadghayyas5941@email.com',
                  ),

                  actions: [

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close'),
                    ),

                  ],
                ),
              );
            },
          ),
        ),

        Card(
          child: ListTile(

            leading: Icon(Icons.calendar_month),
            title: Text('My Bookings'),
            trailing: Icon(Icons.chevron_right),

            onTap: () {
              showMessage(
                context,
                'Booking history is not saved in this demo',
              );
            },
          ),
        ),

        Card(
          child: ListTile(

            leading: Icon(Icons.favorite_border),
            title: Text('Saved Barbers'),
            trailing: Icon(Icons.chevron_right),

            onTap: () {
              showMessage(context, 'No saved barbers');
            },
          ),
        ),

        Card(
          child: ListTile(

            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            trailing: Icon(Icons.chevron_right),

            onTap: () {
              showMessage(context, 'No new notifications');
            },
          ),
        ),

        Card(
          child: ListTile(

            leading: Icon(Icons.help_outline),
            title: Text('Help & Support'),
            trailing: Icon(Icons.chevron_right),

            onTap: () {
              showMessage(context, 'FreshCut Demo Application');
            },
          ),
        ),

        SizedBox(height: 15),

        Card(
          child: ListTile(

            leading: Icon(Icons.logout, color: Colors.red),

            title: Text(
              'Log Out',
              style: TextStyle(color: Colors.red),
            ),

            onTap: () {

              Navigator.pushAndRemoveUntil(
                context,

                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),

                    (route) => false,
              );
            },
          ),
        ),

      ],
    );
  }
}