import 'package:flutter/material.dart';
import 'OrderSummaryScreen.dart';

class screen2 extends StatefulWidget {
  const screen2({super.key});

  @override
  State<screen2> createState() => _screen2State();
}

class _screen2State extends State<screen2> {
  // List of shops with different names, locations, and ratings
  final List<Map<String, String>> shops = [
    {'name': 'Vishal Stores', 'location': 'Worli Mumbai', 'ratings': '204'},
    {'name': 'Abdul Grocery Shop', 'location': 'Prabhadevi Mumbai', 'ratings': '150'},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Local Shopping'),
        backgroundColor: Colors.green.shade600, // Green shade
        centerTitle: true, // Center the title
        elevation: 4.0, // Adds a subtle shadow
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer(); // Opens the drawer (slider)
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Action for search button
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Action for shopping cart button
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green.shade600,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Vishal Stores'),
              leading: Icon(Icons.circle, size: 10),
              onTap: () {
                // Handle shop selection
                Navigator.pop(context); // Close the drawer after selection
              },
            ),
            ListTile(
              title: Text('Abdul Grocery Shop'),
              leading: Icon(Icons.circle, size: 10),
              onTap: () {
                // Handle shop selection
                Navigator.pop(context); // Close the drawer after selection
              },
            ),
            ListTile(
              title: Text('Shop 3'),
              leading: Icon(Icons.circle, size: 10),
              onTap: () {
                // Handle shop selection
                Navigator.pop(context); // Close the drawer after selection
              },
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Other Services', style: TextStyle(fontSize: 16, color: Colors.black)),
            ),
            ListTile(
              title: Text('Plumber'),
              leading: Icon(Icons.build, size: 20),
              onTap: () {
                // Handle plumber selection
                Navigator.pop(context); // Close the drawer after selection
              },
            ),
            ListTile(
              title: Text('Carpenter'),
              leading: Icon(Icons.home_repair_service, size: 20),
              onTap: () {
                // Handle carpenter selection
                Navigator.pop(context); // Close the drawer after selection
              },
            ),
            ListTile(
              title: Text('Painter'),
              leading: Icon(Icons.format_paint, size: 20),
              onTap: () {
                // Handle painter selection
                Navigator.pop(context); // Close the drawer after selection
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: shops.length, // Number of shops
        itemBuilder: (context, index) {
          return ShopCard(
            name: shops[index]['name']!,
            location: shops[index]['location']!,
            ratings: shops[index]['ratings']!,
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, 'OrderSummaryScreen'); // Add action here
                },
              ),
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  // Add action here
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  // Add action here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShopCard extends StatelessWidget {
  final String name;
  final String location;
  final String ratings;

  const ShopCard({
    required this.name,
    required this.location,
    required this.ratings,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'Assests/store.jpeg', // Add your image in assets folder
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Location: $location',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        Icon(Icons.star_half, color: Colors.yellow, size: 20),
                        SizedBox(width: 10),
                        Text(
                          '$ratings Ratings',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'products');
                },
                child: Text(
                    'Products',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
