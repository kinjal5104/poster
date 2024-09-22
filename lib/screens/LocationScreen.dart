import 'package:flutter/material.dart';
import '../widgets/image_slider.dart';

class LocationScreen extends StatelessWidget {
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
            // Action for leading icon
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
        iconTheme: IconThemeData(
          color: Colors.white, // Icon color
          size: 24.0, // Icon size
        ),
        titleTextStyle: const TextStyle(
          color: Colors.white, // Title text color
          fontSize: 20, // Title font size
          fontWeight: FontWeight.bold, // Title font weight
        ),
        shadowColor: Colors.grey, // Shadow color
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(5), // Rounded bottom corners
          ),
        ),
      ),


      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 80),
                  ImageSlider(),
                  SizedBox(height: 20),
                  Text(
                    'Select your location',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle current location logic
                      _useCurrentLocation(context);
                    },
                    icon: Icon(Icons.location_on),
                    label: Text('Use Current Location'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.green, // Button text color
                      padding: EdgeInsets.symmetric(vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'OR',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle manual location input logic
                      _enterLocationManually(context);
                    },
                    icon: Icon(Icons.edit_location_alt),
                    label: Text('Enter Location Manually'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.green, // Button text color
                      padding: EdgeInsets.symmetric(vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
                  // Add action here
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

  // Function to simulate using the current location
  void _useCurrentLocation(BuildContext context) {
    // You can integrate actual location logic here using geolocation packages.
    // For now, this is a simple dialog for demonstration.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Current Location'),
          content: Text('Using your current location...'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, 'screen2');
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Function to simulate manual location entry
  void _enterLocationManually(BuildContext context) {
    // Show a dialog or navigate to another screen where the user can enter an address.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ManualLocationEntryScreen(),
      ),
    );
  }
}

// A simple screen for manual location input
class ManualLocationEntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Location"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'e.g., 1234 Main St',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'screen2');
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.green, // Button text color
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
