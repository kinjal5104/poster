import 'package:flutter/material.dart';
import 'screens/home_screen1.dart';
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
    initialRoute: 'home_screen1',
    debugShowCheckedModeBanner: false,
    routes: {
      'phone': (context) => MyPhone(),
      'otp': (context) => MyOtp(),
      // 'home_screen1': (context) => HomeScreen(),
      'screen1': (context) => Screen1(),
      'screen2': (context) => Screen2(),
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
    home: home_screen1(),
  ));
}
