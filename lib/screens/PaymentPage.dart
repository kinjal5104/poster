import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaymentPage(),
    );
  }
}

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final double totalPrice = 570.0; // Total price as shown in the image
  String selectedPaymentMethod = "Payment on Delivery";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            OrderItem(description: '2 x Amul Cheese - 250g', price: 340),
            OrderItem(description: '1 x Tata Salt - 100g', price: 100),
            OrderItem(description: '1 x Lizol Cleaner - 150g', price: 140),
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
                  '₹ ${totalPrice.toStringAsFixed(0)}',
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
                groupValue: selectedPaymentMethod,
                onChanged: (String? value) {
                  setState(() {
                    selectedPaymentMethod = value!;
                  });
                },
              ),
              title: Text('Payment on Delivery'),
            ),
            ListTile(
              leading: Radio<String>(
                value: "Pay via UPI",
                groupValue: selectedPaymentMethod,
                onChanged: (String? value) {
                  setState(() {
                    selectedPaymentMethod = value!;
                  });
                },
              ),
              title: Text('Pay via UPI'),
            ),
            SizedBox(height: 20),
            // Confirm Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle payment confirmation
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Payment method: $selectedPaymentMethod, Total: ₹${totalPrice.toStringAsFixed(0)}'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                  EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                  textStyle: TextStyle(fontSize: 16.0),
                ),
                child: Text('Click to confirm'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Order Item Widget to reuse
class OrderItem extends StatelessWidget {
  final String description;
  final double price;

  OrderItem({required this.description, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(description),
          Text('₹ ${price.toStringAsFixed(0)}'),
        ],
      ),
    );
  }
}
