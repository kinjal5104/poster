import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green.shade600,
            ),
            child: const Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Vishal Stores'),
            leading: Icon(Icons.circle, size: 10),
            onTap: () {
              // Handle shop selection
              Navigator.pop(context); // Close the drawer after selection
            },
          ),
          ListTile(
            title: Text('Shop 2'),
            leading: Icon(Icons.circle, size: 10),
            onTap: () {
              // Handle shop selection
              Navigator.pop(context); // Close the drawer after selection
            },
          ),
          ListTile(
            title: Text('Shop 3'),
            leading: Icon(Icons.circle, size: 10),
            onTap: () {
              // Handle shop selection
              Navigator.pop(context); // Close the drawer after selection
            },
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Other Services',
                style: TextStyle(fontSize: 16, color: Colors.black)),
          ),
          ListTile(
            title: Text('Plumber'),
            leading: Icon(Icons.build, size: 20),
            onTap: () {
              // Handle plumber selection
              Navigator.pop(context); // Close the drawer after selection
            },
          ),
          ListTile(
            title: Text('Carpenter'),
            leading: Icon(Icons.home_repair_service, size: 20),
            onTap: () {
              // Handle carpenter selection
              Navigator.pop(context); // Close the drawer after selection
            },
          ),
          ListTile(
            title: Text('Painter'),
            leading: Icon(Icons.format_paint, size: 20),
            onTap: () {
              // Handle painter selection
              Navigator.pop(context); // Close the drawer after selection
            },
          ),
        ],
      ),
    );
  }
}
