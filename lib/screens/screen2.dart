import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'OrderSummaryScreen.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final List<Map<String, dynamic>> shops = [
    {'name': 'Vishal Stores', 'location': 'Worli, Mumbai', 'lat': 19.0176, 'lon': 72.8562, 'ratings': '204'},
    {'name': 'Abdul Grocery Shop', 'location': 'Prabhadevi, Mumbai', 'lat': 19.0167, 'lon': 72.8300, 'ratings': '150'},
    {'name': 'Swami Samarth Kirana Stores', 'location': 'Ulhasnagar, Kalyan', 'lat': 37.42, 'lon': -122.084, 'ratings': '160'},
    {'name': 'Shreeram Stores', 'location': 'Thane', 'lat': 19.2183, 'lon': 72.9781, 'ratings': '150'},
    {'name': 'Dmart', 'location': 'Lower Parel, Mumbai', 'lat': 19.0033, 'lon': 72.8296, 'ratings': '320'},
    {'name': 'Big Bazaar', 'location': 'Vashi, Navi Mumbai', 'lat': 19.0771, 'lon': 72.9986, 'ratings': '260'},
    {'name': 'More Supermarket', 'location': 'Ghatkopar, Mumbai', 'lat': 19.0856, 'lon': 72.9081, 'ratings': '310'},
    {'name': 'Reliance Fresh', 'location': 'Mulund, Mumbai', 'lat': 19.1726, 'lon': 72.9597, 'ratings': '290'},
    {'name': 'Apna Bazar', 'location': 'Chembur, Mumbai', 'lat': 19.0623, 'lon': 72.9270, 'ratings': '270'},
    {'name': 'Star Bazaar', 'location': 'Andheri, Mumbai', 'lat': 19.1197, 'lon': 72.8479, 'ratings': '315'},
  ];

  List<Map<String, dynamic>> filteredShops = [];
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments;

    if (arguments is Position) {
      _filterShopsByCurrentLocation(arguments);
    } else if (arguments is String) {
      _filterShopsByManualEntry(arguments);
    }
  }

  void _filterShopsByCurrentLocation(Position position) {
    setState(() {
      filteredShops = shops.where((shop) {
        double distanceInMeters = Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          shop['lat'],
          shop['lon'],
        );
        return distanceInMeters <= 10000; // 10 km radius
      }).toList();
      isLoading = false;
    });
  }

  void _filterShopsByManualEntry(String locationFilter) {
    setState(() {
      filteredShops = shops.where((shop) {
        return shop['location'].toLowerCase().contains(locationFilter.toLowerCase());
      }).toList();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Local Shopping'),
        backgroundColor: Colors.green.shade600,
        centerTitle: true,
        elevation: 4.0,
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : filteredShops.isEmpty
            ? Text('No shops found for the selected location.')
            : Expanded(
          child: ListView.builder(
            itemCount: filteredShops.length,
            itemBuilder: (context, index) {
              return ShopCard(
                name: filteredShops[index]['name'],
                location: filteredShops[index]['location'],
                ratings: filteredShops[index]['ratings'],
              );
            },
          ),
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
                  Navigator.pushNamed(context, 'OrderSummaryScreen');
                },
              ),
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShopCard extends StatelessWidget {
  final String name;
  final String location;
  final String ratings;

  const ShopCard({
    required this.name,
    required this.location,
    required this.ratings,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'Assests/store.jpeg',
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Location: $location',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        Icon(Icons.star_half, color: Colors.yellow, size: 20),
                        SizedBox(width: 10),
                        Text(
                          '$ratings Ratings',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'products');
                },
                child: Text(
                  'Explore',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
