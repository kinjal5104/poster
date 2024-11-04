import 'package:flutter/material.dart';
import 'PhonePePayment.dart';

class PaymentPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final double totalPrice;

  PaymentPage({
    required this.cartItems,
    required this.totalPrice,
  });

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _selectedPaymentMethod = "Payment via UPI"; // Default selected payment method
  bool _isOrderConfirmed = false; // Track if the order is confirmed

  void _confirmOrder() {
    setState(() {
      _isOrderConfirmed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green.shade600,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isOrderConfirmed ? _buildOrderConfirmation() : _buildPaymentOptions(),
      ),
    );
  }

  Widget _buildPaymentOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Order's Summary Section
        Text(
          "Order's Summary",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: widget.cartItems.length,
            itemBuilder: (context, index) {
              final item = widget.cartItems[index];
              return OrderItem(
                description: '${item['quantity']} x ${item['name']}',
                price: (item['price'] is int ? (item['price'] as int).toDouble() : item['price']) * item['quantity'].toDouble(),
              );
            },
          ),
        ),
        Divider(),
        // Total Price
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '₹ ${widget.totalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        // Payment Method Section
        Text(
          'Select mode of payment',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 8),
        ListTile(
          leading: Radio<String>(
            value: "Payment on Delivery",
            groupValue: _selectedPaymentMethod,
            onChanged: (value) {
              setState(() {
                _selectedPaymentMethod = value!;
              });
            },
          ),
          title: Text("Payment on Delivery"),
        ),
        ListTile(
          leading: Radio<String>(
            value: "Payment via UPI",
            groupValue: _selectedPaymentMethod,
            onChanged: (value) {
              setState(() {
                _selectedPaymentMethod = value!;
              });
            },
          ),
          title: Text("Payment via UPI"),
        ),
        ElevatedButton(
          onPressed: () {
            if (_selectedPaymentMethod == "Payment via UPI") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhonePePayment(), //
                ),
              );
            } else {
              _confirmOrder();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade600,
          ),
          child: Text(
              'Click to confirm',
              style: TextStyle(color: Colors.white)
          ),
        ),
      ],
    );
  }

  Widget _buildOrderConfirmation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Order's Summary",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: widget.cartItems.length,
            itemBuilder: (context, index) {
              final item = widget.cartItems[index];
              return OrderItem(
                description: '${item['quantity']} x ${item['name']}',
                price: (item['price'] is int ? (item['price'] as int).toDouble() : item['price']) * item['quantity'].toDouble(),
              );
            },
          ),
        ),
        Divider(),
        // Total Price
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '₹ ${widget.totalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        // Confirmation Message
        Text(
          'Your Order was placed successfully',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.green,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '• Your Order will arrive in 15-20 min\n• To cancel your order click on the below button within 10 minutes',
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // Action for cancel order
            setState(() {
              _isOrderConfirmed = false; // Reset to go back
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade600,
          ),
          child: Text(
              'Click to cancel',
              style: TextStyle(color: Colors.white)
          ),
        ),
      ],
    );
  }
}

class OrderItem extends StatelessWidget {
  final String description;
  final double price;

  const OrderItem({
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(description),
          Text('₹ ${price.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
