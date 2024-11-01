import 'package:flutter/material.dart';
import '../widgets/image_slider1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home_screen1(),
    );
  }
}

class home_screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: AppBar(
          backgroundColor: Colors.green,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(5),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.zero, // Remove all padding
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.start, // Align children to the start
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0, // Adjusted top padding
                    bottom: 2, // Bottom padding
                    left: 0, // Left padding
                    right: 0, // Right padding
                  ),
                  child: Text(
                    'ShopLocalia',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
                Spacer(), // Space between text and logo
                Container(
                  padding: EdgeInsets.only(
                    top: 20, // Adjusted top padding
                    bottom: 5, // Desired bottom padding
                    left: 50, // Desired left padding
                    right: 0, // Desired right padding
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'Assests/logo1.png', // Ensure the asset path is correct
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: Column(
        children: [
          // First child is an image
          ImageSlider1(),
          SizedBox(height: 10),
          // Other children can be added below
          Text(
            "Where Local Meets Convenience",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 25), // Spacer between text and skip login button

          // Login button
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'phone');// Add login action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Button color
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height:40),
          Image.asset(
            'Assests/mid.png', // Ensure the path is correct
            width: double.infinity,
            height: 180,
            fit: BoxFit.cover,
          ),



          SizedBox(height: 53.5), // Spacer between text and skip login button
          Padding(
            padding: EdgeInsets.only(
              top: 0,      // Replace with desired top padding
              bottom: 0,   // Replace with desired bottom padding
              left: 0,     // Replace with desired left padding
              right: 0,    // Replace with desired right padding
            ),
            child: Image.asset(
              'Assests/bottom.png', // Make sure the path is correct
              width: double.infinity,
              height: 60,
              fit: BoxFit.cover,
            ),
          )



        ],
      ),
    );
  }
}