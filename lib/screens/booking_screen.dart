import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {

  final String barberName;

  const BookingScreen({
    super.key,
    required this.barberName,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  TextEditingController customer = TextEditingController();
  TextEditingController phone = TextEditingController();

  String service = 'Haircut';
  String time = '10:00 AM';

  @override
  void dispose() {
    customer.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: ListView(
        padding: EdgeInsets.all(20),
        children: [

          Text(
            'Barber: ${widget.barberName}',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 25),

          TextField(
            controller: customer,
            decoration: InputDecoration(
              labelText: 'Your Name',
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 15),

          TextField(
            controller: phone,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 25),

          Text(
            'Select Service',
            style: TextStyle(fontSize: 20),
          ),

          SizedBox(height: 10),

          Row(
            children: [

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    service = 'Haircut';
                  });
                },
                child: Text('Haircut'),
              ),

              SizedBox(width: 10),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    service = 'Beard Trim';
                  });
                },
                child: Text('Beard Trim'),
              ),

            ],
          ),

          SizedBox(height: 10),

          Text('Selected Service: $service'),

          SizedBox(height: 25),

          Text(
            'Select Time',
            style: TextStyle(fontSize: 20),
          ),

          SizedBox(height: 10),

          Row(
            children: [

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    time = '10:00 AM';
                  });
                },
                child: Text('10:00 AM'),
              ),

              SizedBox(width: 10),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    time = '11:00 AM';
                  });
                },
                child: Text('11:00 AM'),
              ),

            ],
          ),

          SizedBox(height: 10),

          Text('Selected Time: $time'),

          SizedBox(height: 20),

          Text(
            'Total: Rs. ${service == 'Haircut' ? 400 : 200}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 25),

          ElevatedButton(
            onPressed: () {

              if (customer.text.trim().isEmpty ||
                  phone.text.trim().isEmpty) {

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please fill all fields'),
                  ),
                );

              } else {

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Appointment Confirmed'),

                    content: Text(
                      'Thank you ${customer.text}!\n'
                          'Barber: ${widget.barberName}\n'
                          'Service: $service\n'
                          'Time: $time\n'
                          'Total: Rs. ${service == 'Haircut' ? 400 : 200}',
                    ),

                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );

              }
            },

            child: Text('Confirm Booking'),
          ),

        ],
      ),
    );
  }
}
