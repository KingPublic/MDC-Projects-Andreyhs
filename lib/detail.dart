import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productName;
  final String productPrice;
  final Image productImage;
  final String productDescription;

  const ProductDetailsPage({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
        backgroundColor: const Color.fromARGB(169, 199, 199, 164),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: productImage, // Menampilkan gambar produk
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              productName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Price: $productPrice',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              productDescription,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk menambah ke keranjang
              },
              child: const Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
