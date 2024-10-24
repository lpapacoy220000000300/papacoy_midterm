import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products =
        ModalRoute.of(context)?.settings.arguments as List<Map<String, String>>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: products.isEmpty
            ? Center(
                child: Text(
                  'No products added yet!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            : ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    elevation: 2,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(products[index]['quantity'] ?? '0'),
                        backgroundColor: Color.fromARGB(255, 168, 168, 180),
                      ),
                      title: Text(
                        products[index]['name'] ?? '',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      subtitle:
                          Text('Quantity: ${products[index]['quantity']}'),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
