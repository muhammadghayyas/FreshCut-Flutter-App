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

  DateTime? selectedDate;

  Map<String, int> services = {
    'Haircut': 400,
    'Beard Trim': 200,
    'Hair Wash': 150,
  };

  List<String> times = [
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
  ];


  // Date Selection Function

  Future<void> selectDate() async {

    DateTime today = DateTime.now();

    DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? today,
      firstDate: today,
      lastDate: today.add(Duration(days: 30)),
    );

    if (date != null && mounted) {

      setState(() {
        selectedDate = date;
      });

    }
  }


  // Booking Function

  void confirmBooking() {

    if (customer.text.trim().isEmpty ||
        phone.text.trim().isEmpty ||
        selectedDate == null) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all fields'),
        ),
      );

    } else {

      showDialog(
        context: context,

        builder: (context) => AlertDialog(

          title: Text('Booking Summary'),

          content: Text(
            'Customer: ${customer.text}\n'
                'Phone: ${phone.text}\n'
                'Barber: ${widget.barberName}\n'
                'Service: $service\n'
                'Date: ${selectedDate!.day}/'
                '${selectedDate!.month}/'
                '${selectedDate!.year}\n'
                'Time: $time\n'
                'Total: Rs. ${services[service]}\n\n'
                'This is a demo appointment.',
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
  }


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
      ),

      body: ListView(
        padding: EdgeInsets.all(20),

        children: [

          Text(
            'Barber: ${widget.barberName}',

            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 25),

          TextField(
            controller: customer,

            decoration: InputDecoration(
              labelText: 'Your Name',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 15),

          TextField(
            controller: phone,
            keyboardType: TextInputType.phone,

            decoration: InputDecoration(
              labelText: 'Phone Number',
              prefixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 25),

          Text(
            'Select Service',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          for (var item in services.keys)

            Card(
              child: ListTile(

                leading: Icon(
                  service == item
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,

                  color: Color(0xFF205E50),
                ),

                title: Text(item),

                trailing: Text(
                  'Rs. ${services[item]}',
                ),

                onTap: () {
                  setState(() {
                    service = item;
                  });
                },
              ),
            ),

          SizedBox(height: 25),

          Text(
            'Select Date',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          OutlinedButton.icon(

            onPressed: selectDate,

            icon: Icon(Icons.calendar_month),

            label: Text(
              selectedDate == null

                  ? 'Choose Date'

                  : '${selectedDate!.day}/'
                  '${selectedDate!.month}/'
                  '${selectedDate!.year}',
            ),
          ),

          SizedBox(height: 25),

          Text(
            'Available Time',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          Wrap(
            spacing: 8,
            runSpacing: 8,

            children: [

              for (String item in times)

                ElevatedButton(

                  style: ElevatedButton.styleFrom(

                    backgroundColor: time == item
                        ? Color(0xFF205E50)
                        : Colors.grey.shade200,

                    foregroundColor: time == item
                        ? Colors.white
                        : Colors.black,
                  ),

                  onPressed: () {

                    setState(() {
                      time = item;
                    });

                  },

                  child: Text(item),
                ),

            ],
          ),

          SizedBox(height: 25),

          Divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              Text(
                'Total Amount',
                style: TextStyle(fontSize: 18),
              ),

              Text(
                'Rs. ${services[service]}',

                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF205E50),
                ),
              ),

            ],
          ),

          SizedBox(height: 25),

          ElevatedButton(
            onPressed: confirmBooking,
            child: Text('Confirm Booking'),
          ),

        ],
      ),
    );
  }
}