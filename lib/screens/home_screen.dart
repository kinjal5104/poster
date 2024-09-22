import 'package:flutter/material.dart';
import '../widgets/image_slider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageSlider(),
              // Carousel with images
              const SizedBox(height: 20),
              // Logo Image (below carousel)
              Image.asset(
                'Assests/logo.png', // Replace with your logo asset
                height: 100,
              ),
              const SizedBox(height: 20),
              // Skip Login and Login / Signup Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  SizedBox(
                    width: 200,  // Set the desired width
                    height: 50,  // Set the desired height
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600, // Green background
                        foregroundColor: Colors.white, // White text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.green), // Green border
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'phone');
                      },
                      child: const Text('Login'),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
