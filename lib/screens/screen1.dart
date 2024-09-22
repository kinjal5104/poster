import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ONLINE LOCAL SHOPPING"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {
              // Implement location functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              'https://example.com/super_grocery_sale_image.png', // Replace with actual image URL
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                List<String> items = [
                  'Amul Cheese (200g)',
                  'Broccoli',
                  'Bananas',
                  'Tomatoes'
                ];
                return ListTile(
                  leading: Icon(Icons.shopping_basket, color: Colors.green),
                  title: Text(items[index]),
                  subtitle: Text("Price: ₹${(index + 1) * 50}"),
                  trailing: IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      // Add to cart functionality
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Assuming the second screen is selected
        selectedItemColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
