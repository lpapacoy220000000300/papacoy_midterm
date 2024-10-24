import 'package:flutter/material.dart';
import 'edit_screen.dart';

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
                        backgroundColor: Colors.blueAccent,
                      ),
                      title: Text(
                        products[index]['name'] ?? '',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      subtitle:
                          Text('Quantity: ${products[index]['quantity']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          final updatedProduct = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditScreen(
                                productName: products[index]['name'] ?? '',
                                productQuantity:
                                    products[index]['quantity'] ?? '',
                                index: index,
                              ),
                            ),
                          );

                          if (updatedProduct != null) {
                            products[index]['name'] = updatedProduct['name'];
                            products[index]['quantity'] =
                                updatedProduct['quantity'];
                            // Refresh the ListView by calling setState
                            (context as Element).reassemble();
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
