import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const double paddingValue = 16.0;
  static const double buttonVerticalPadding = 15.0;
  static const Color primaryColor = Colors.blueAccent;
  static const Color backgroundColor =
      Color.fromARGB(255, 68, 81, 88); // Define background color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Management'),
        centerTitle: true,
      ),
      backgroundColor: backgroundColor, // Set the background color here
      body: Padding(
        padding: const EdgeInsets.all(paddingValue),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildHeader(),
            const SizedBox(height: 30),
            _buildPlaceholderImage(),
            const SizedBox(height: 30),
            _buildAddProductsButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      'Manage your inventory!',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.grey[200], // Background color of the container
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: Icon(
        Icons.inventory, // Inventory icon
        size: 100,
        color: Colors.black, // Icon color changed to black
      ),
    );
  }

  Widget _buildAddProductsButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, '/input');
      },
      icon: const Icon(Icons.add_circle_outline),
      label: const Text('Add Products'),
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        padding: EdgeInsets.symmetric(vertical: buttonVerticalPadding),
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
