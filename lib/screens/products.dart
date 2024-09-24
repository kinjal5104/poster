import 'package:flutter/material.dart';
import 'OrderSummaryScreen.dart';


class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  // Sample product data
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Amul Cheese',
      'price': 135,
      'image': 'Assests/th.jpeg', // Replace with the correct image path
      'quantity': 0,
      'isSelected': false
    },
    {
      'name': 'Paneer',
      'price': 135,
      'image': 'Assests/th.jpeg', // Replace with the correct image path
      'quantity': 0,
      'isSelected': false
    },
    {
      'name': 'Dal',
      'price': 135,
      'image': 'Assests/th.jpeg', // Replace with the correct image path
      'quantity': 0,
      'isSelected': false
    },
    {
      'name': 'Spices',
      'price': 135,
      'image': 'Assests/th.jpeg', // Replace with the correct image path
      'quantity': 0,
      'isSelected': false
    },
  ];

  int totalItemsInCart = 0;

  // Function to update cart
  void incrementQuantity(int index) {
    setState(() {
      products[index]['quantity']++;
      products[index]['isSelected'] = true;
      updateCartCount();
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      if (products[index]['quantity'] > 0) {
        products[index]['quantity']--;
        updateCartCount();
      }
      if (products[index]['quantity'] == 0) {
        products[index]['isSelected'] = false;
      }
    });
  }

  void updateCartCount() {
    totalItemsInCart = products.fold(0, (sum, item) => sum + (item['quantity'] as int));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        backgroundColor: Colors.green.shade600,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            name: product['name'],
            price: product['price'],
            image: product['image'],
            quantity: product['quantity'],
            isSelected: product['isSelected'],
            onAdd: () => incrementQuantity(index),
            onRemove: () => decrementQuantity(index),
          );
        },
      ),
      // Show Add to Cart button if items are in the cart
      bottomNavigationBar: totalItemsInCart > 0
          ? BottomAppBar(

        child: Padding(

          padding: const EdgeInsets.all(10.0),
           child:  ElevatedButton(
              onPressed: () {
                // Navigate to the OrderSummaryScreen with cart items
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderSummaryScreen(
                      cartItems: products.where((item) => item['quantity'] > 0).toList(), // Only pass items with quantity > 0
                      onAddItems: () {
                        Navigator.pop(context); // Navigate back to add more items
                      },
                    ),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Added $totalItemsInCart items to the cart!',
                    style: TextStyle(color: Colors.white),
                  ),
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,// Keeping the green background
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                //padding: EdgeInsets.all(15),
                minimumSize: Size(double.infinity, 50), // Full width
              ),
              child: Text(
                'ADD TO CART',
                style: TextStyle(

                  fontSize: 18, // Adjust font size as needed
                             // To make the text stand out more
                  color: Colors.white, // Change to white for better visibility
                ),
              ),
            )


        ),
      )
          : SizedBox.shrink(), // If no items are selected, hide the button
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final int price;
  final String image;
  final int quantity;
  final bool isSelected;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const ProductCard({
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
    required this.isSelected,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        color: isSelected ? Colors.grey[300] : Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image, // Product image
              width: 60,
              height: 60,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.black : Colors.black,
                    ),
                  ),
                  Text(
                    'Rs. $price',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'customisable',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            isSelected
                ? Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  color: Colors.green,
                  onPressed: onRemove,
                ),
                Text(
                  '$quantity',
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.green,
                  onPressed: onAdd,
                ),
              ],
            )
                : ElevatedButton(
              onPressed: onAdd,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                '+ Add',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
