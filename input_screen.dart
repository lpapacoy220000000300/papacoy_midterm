import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController productController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  List<Map<String, String>> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      backgroundColor:
          Color.fromARGB(255, 141, 150, 154), // Set background color here
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Enter Product Details',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: productController,
              decoration: InputDecoration(
                labelText: 'Product Name',
                prefixIcon: Icon(Icons.production_quantity_limits),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: quantityController,
              decoration: InputDecoration(
                labelText: 'Quantity',
                prefixIcon: Icon(Icons.format_list_numbered),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  products.add({
                    'name': productController.text,
                    'quantity': quantityController.text,
                  });
                });
                productController.clear();
                quantityController.clear();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 161, 184, 196),
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 16),
              ),
              child: Text('Add Product'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list', arguments: products);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 16),
              ),
              child: Text('View Product List'),
            ),
          ],
        ),
      ),
    );
  }
}
