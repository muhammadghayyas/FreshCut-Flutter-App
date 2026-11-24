import 'package:flutter/material.dart';
import 'barbers_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;

  List<String> titles = [
    'FreshCut',
    'Our Barbers',
    'My Profile',
  ];

  @override
  Widget build(BuildContext context) {

    List<Widget> screens = [
      HomeContent(
        onExplore: () {
          setState(() {
            selectedIndex = 1;
          });
        },
      ),

      BarbersScreen(),
      ProfileScreen(),
    ];

    return Scaffold(

      appBar: AppBar(
        title: Text(titles[selectedIndex]),

        actions: [
          IconButton(
            icon: Icon(Icons.notifications),

            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('No new notifications'),
                ),
              );
            },
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: [

            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF205E50),
              ),

              child: Column(
                children: [

                  CircleAvatar(
                    radius: 35,
                    child: Icon(Icons.person, size: 40),
                  ),

                  SizedBox(height: 10),

                  Text(
                    'FreshCut',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),

              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });

                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.content_cut),
              title: Text('Barbers'),

              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });

                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),

              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });

                Navigator.pop(context);
              },
            ),

          ],
        ),
      ),

      body: screens[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: selectedIndex,
        selectedItemColor: Color(0xFF205E50),
        unselectedItemColor: Colors.grey,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        items: [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.content_cut),
            label: 'Barbers',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),

        ],
      ),
    );
  }
}


// Home Content Widget

class HomeContent extends StatelessWidget {

  final VoidCallback onExplore;

  const HomeContent({
    super.key,
    required this.onExplore,
  });

  @override
  Widget build(BuildContext context) {

    return ListView(
      padding: EdgeInsets.all(20),

      children: [

        Row(
          children: [

            CircleAvatar(
              radius: 25,
              child: Icon(Icons.person, size: 30),
            ),

            SizedBox(width: 12),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text('Welcome to FreshCut'),

                Text(
                  'Hello, Customer!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

          ],
        ),

        SizedBox(height: 25),

        Container(
          decoration: BoxDecoration(
            color: Color(0xFF205E50),
            borderRadius: BorderRadius.circular(15),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15),
                ),

                child: Image.asset(
                  'assets/images/banner.png',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Padding(
                padding: EdgeInsets.all(15),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text(
                      'Fresh Look, Better Mood',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      'Book your haircut with ease.',
                      style: TextStyle(color: Colors.white),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),

        SizedBox(height: 25),

        Text(
          'Popular Services',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 15),

        Row(
          children: [

            Expanded(
              child: ServiceCard(
                name: 'Haircut',
                price: 'Rs. 400',
                icon: Icons.content_cut,
              ),
            ),

            SizedBox(width: 10),

            Expanded(
              child: ServiceCard(
                name: 'Beard Trim',
                price: 'Rs. 200',
                icon: Icons.face,
              ),
            ),

          ],
        ),

        SizedBox(height: 25),

        ElevatedButton(
          onPressed: onExplore,
          child: Text('Explore Barbers'),
        ),

      ],
    );
  }
}


// Custom Service Card Widget

class ServiceCard extends StatelessWidget {

  final String name;
  final String price;
  final IconData icon;

  const ServiceCard({
    super.key,
    required this.name,
    required this.price,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [

            Icon(
              icon,
              size: 35,
              color: Color(0xFF205E50),
            ),

            SizedBox(height: 10),

            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 5),

            Text(price),

          ],
        ),
      ),
    );
  }
}