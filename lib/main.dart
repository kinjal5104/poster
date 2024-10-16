import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/phone.dart';
import 'screens/otp.dart';
import 'screens/screen1.dart';
import 'screens/LocationScreen.dart';
import 'screens/screen2.dart';
import 'screens/products.dart';
import 'screens/OrderSummaryScreen.dart';
import 'screens/PaymentPage.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'home_screen',
    debugShowCheckedModeBanner: false,
    routes: {
      'phone': (context) => MyPhone(),
      'otp': (context) => MyOtp(),
      'home_screen': (context) => HomeScreen(),
      'screen1': (context) => Screen1(),
      'screen2': (context) => screen2(),
      'LocationScreen': (context) => LocationScreen(),
      'products': (context) => ProductListScreen(),
      'OrderSummaryScreen': (context) => OrderSummaryScreen(
        cartItems: [], // Initialize an empty cart
        onAddItems: () {},
      ),
    },
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    home: HomeScreen(),
  ));
}
