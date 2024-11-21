import 'package:flutter/material.dart';
import 'detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showFullScreenMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height, // Full height
          color: Colors.white,
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                color: const Color.fromARGB(169, 199, 199, 164),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Select Category',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              // Category Options
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text('All'),
                      onTap: () {
                      
                        print('Selected category: All');
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      title: const Text('Chair'),
                      onTap: () {
                        
                        print('Selected category: Chair');
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      title: const Text('Couch'),
                      onTap: () {
                       
                        print('Selected category: Couch');
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      title: const Text('Table') ,
                      onTap: () {
                        
                        print('Selected category: Table');
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            // Brand Icon
            Image.asset(
              'assets/removelivin.png', // Path ke icon brand kamu
              height: 90, 
              width: 130,
              fit: BoxFit.cover,
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(169, 199, 199, 164),
        actions: [
          // Icon Burger Menu
          IconButton(
            icon: const Icon(Icons.menu), // Icon burger
            onPressed: () {
              //tampil
              _showFullScreenMenu(context);
            },
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2, // Dua kolom
            childAspectRatio: 0.6, // Rasio tinggi terhadap lebar
            mainAxisSpacing: 8.0, // Jarak vertikal antar elemen
            crossAxisSpacing: 10.0, // Jarak horizontal antar elemen
            children: List.generate(
              data.length,
              (index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsPage(
                        productName: 'Product ${index + 1}',
                        productPrice: '\$${100 * (index + 1)}',
                        productImage: data[index],
                        productDescription: descriptions[index],
                      ),
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: data[index], // Menampilkan gambar
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Product ${index + 1}'),
                      ),
                      Text('\$${100 * (index + 1)}'),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                          child: ElevatedButton(
                            child: const Text('Add to Cart'),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Sample Data
final List<Image> data = [
  Image.asset('assets/fur1.jpg', fit: BoxFit.cover),
  Image.asset('assets/fur5.jpg', fit: BoxFit.cover),
  Image.asset('assets/fur3.jpg', fit: BoxFit.cover),
  Image.asset('assets/fur4.jpg', fit: BoxFit.cover),
];

// Descriptions for each product
final List<String> descriptions = [
  "A modern and elegant shelf to match your living room.",
  "A stylish and comfortable bed for relaxation.",
  "A cozy living room for your life",
  "A luxurious sofa to enhance your style decor.",
];
