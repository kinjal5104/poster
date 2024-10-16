import 'package:flutter/material.dart';
import 'PaymentPage.dart';

class OrderSummaryScreen extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final VoidCallback onAddItems;

  const OrderSummaryScreen({
    required this.cartItems,
    required this.onAddItems,
  });

  @override
  _OrderSummaryScreenState createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  // Method to calculate the total price
  double calculateTotalPrice() {
    return widget.cartItems.fold(0.0, (sum, item) {
      return sum + (item['price'].toDouble() * item['quantity'].toDouble());
    });
  }

  // Method to handle increment
  void incrementQuantity(int index) {
    setState(() {
      if (widget.cartItems[index]['quantity'] < 10) {
        widget.cartItems[index]['quantity']++;
      }
    });
  }

  // Method to handle decrement
  void decrementQuantity(int index) {
    setState(() {
      if (widget.cartItems[index]['quantity'] > 1) {
        widget.cartItems[index]['quantity']--;
      }
    });
  }

  // Method to delete an item from the cart
  void deleteItem(int index) {
    setState(() {
      widget.cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order’s Summary - Cart'),
        backgroundColor: Colors.green.shade600,
      ),
      body: Column(
        children: [
          Expanded(
            child: widget.cartItems.isEmpty
                ? Center(
              child: Text('No items in the cart'),
            )
                : ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final item = widget.cartItems[index];
                return OrderSummaryCard(
                  name: item['name'],
                  price: item['price'].toDouble(), // Ensure price is double
                  quantity: item['quantity'], // Keep quantity as int
                  image: item['image'],
                  onIncrement: () => incrementQuantity(index),
                  onDecrement: () => decrementQuantity(index),
                  onDelete: () => deleteItem(index),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: widget.onAddItems,
                  icon: Icon(Icons.add),
                  label: Text('Add items'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.green.shade600),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(
                          cartItems: widget.cartItems,
                          totalPrice: calculateTotalPrice(),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade600,
                  ),
                  child: Text(
                    '₹ ${calculateTotalPrice().toStringAsFixed(2)} Total',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderSummaryCard extends StatelessWidget {
  final String name;
  final double price; // Ensure price is double
  final int quantity;
  final String image;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;

  const OrderSummaryCard({
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.asset(image, width: 60, height: 60),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('₹ ${price.toStringAsFixed(2)}', style: TextStyle(fontSize: 16)),
                  Text('Quantity: $quantity', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.green),
                  onPressed: onDecrement,
                ),
                Text('$quantity', style: TextStyle(fontSize: 18)),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.green),
                  onPressed: onIncrement,
                ),
              ],
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: onDelete,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
