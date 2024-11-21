import 'package:flutter/material.dart';
import 'home.dart';
class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login"),backgroundColor: Color.fromARGB(169, 199, 199, 164),foregroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Menambahkan gambar logo di bagian atas
            Container(
              width: 150, // Lebar gambar
              height: 150, // Tinggi gambar
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), // Sudut melengkung
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Bayangan gambar
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // Posisi bayangan
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/livin.png', // Gambar yang ingin digunakan
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30), // Jarak antara gambar dan input

            // Input Username
            TextField(
              controller : usernameController,
              decoration: InputDecoration(
                labelText: "Username",
                labelStyle: TextStyle(color: Color.fromARGB(169, 199, 199, 164)),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide:BorderSide(color: Color.fromARGB(169, 199, 199, 164))
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 148, 148, 89)), // Warna border saat fokus
                ),
                prefixIcon: Icon(Icons.person,color: Color.fromARGB(169, 199, 199, 164),), // Menambahkan ikon di depan
              ),
              style: TextStyle(color: Color.fromARGB(169, 199, 199, 164)),
            ),

            // Input Password
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 18),
              child: TextField(
                controller : passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Color.fromARGB(169, 199, 199, 164),
                  ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(169, 199, 199, 164),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 148, 148, 89), // Warna border saat fokus
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color.fromARGB(169, 199, 199, 164), // Warna ikon
                  ),
                ),
                style: TextStyle(
                  color: Color.fromARGB(169, 199, 199, 164), // Warna teks yang diketikkan
                ),
              ),
            ),

            // Tombol Login
            ElevatedButton(
              onPressed: () {
                String username = usernameController.text;
                String password = passwordController.text;

                if (username.isNotEmpty && password.isNotEmpty) {
                  // Jika username dan password terisi
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else {
                  // Jika ada yang kosong
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter both username and password')),
                  );
                }
              },
              child: const Text("Login"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFd7a15e), // Background warna tombol
                foregroundColor: Colors.white, // Warna teks pada tombol
                shadowColor: Colors.black.withOpacity(0.3), // Efek bayangan
                elevation: 5, // Elevasi tombol
                textStyle: TextStyle(fontSize: 18), // Ukuran font
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24), // Padding tombol
                shape: RoundedRectangleBorder( // Bentuk tombol
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
