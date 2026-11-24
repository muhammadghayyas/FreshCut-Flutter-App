import 'package:flutter/material.dart';
import 'barber_detail_screen.dart';

class BarbersScreen extends StatefulWidget {
  const BarbersScreen({super.key});

  @override
  State<BarbersScreen> createState() => _BarbersScreenState();
}

class _BarbersScreenState extends State<BarbersScreen> {

  String search = '';

  List<Map<String, String>> barbers = [

    {
      'name': 'Khalil',
      'experience': '5 Years Experience',
      'image': 'assets/images/barber1.jpg',
      'rating': '4.9',
    },

    {
      'name': 'Ahmed',
      'experience': '3 Years Experience',
      'image': 'assets/images/barber2.jpg',
      'rating': '4.7',
    },

    {
      'name': 'Sunain',
      'experience': '4 Years Experience',
      'image': 'assets/images/barber3.jpg',
      'rating': '4.8',
    },

  ];

  @override
  Widget build(BuildContext context) {

    List<Map<String, String>> filteredBarbers = [];

    for (var barber in barbers) {

      if (barber['name']!
          .toLowerCase()
          .contains(search.toLowerCase())) {

        filteredBarbers.add(barber);
      }
    }

    return Column(
      children: [

        Padding(
          padding: EdgeInsets.all(15),

          child: TextField(

            decoration: InputDecoration(
              hintText: 'Search barber...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),

            onChanged: (value) {
              setState(() {
                search = value;
              });
            },
          ),
        ),

        Expanded(
          child: filteredBarbers.isEmpty

              ? Center(
            child: Text('No barber found'),
          )

              : ListView.builder(

            itemCount: filteredBarbers.length,

            itemBuilder: (context, index) {

              var barber = filteredBarbers[index];

              return Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 7,
                ),

                child: ListTile(

                  leading: CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(
                      barber['image']!,
                    ),
                  ),

                  title: Text(
                    barber['name']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  subtitle: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Text(barber['experience']!),

                      Row(
                        children: [

                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 18,
                          ),

                          SizedBox(width: 5),

                          Text(barber['rating']!),

                        ],
                      ),

                    ],
                  ),

                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),

                  onTap: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BarberDetailScreen(

                              name: barber['name']!,
                              experience:
                              barber['experience']!,
                              image: barber['image']!,
                              rating: barber['rating']!,

                            ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),

      ],
    );
  }
}