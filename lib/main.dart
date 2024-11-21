import 'package:flutter/material.dart';
import 'onboarding.dart'; // Import file di mana OnboardingPage berada
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(
        pages: [
          Onboarding(
            title: 'Welcome to my App',
            description: 'Discover the amazing features we have to offer.',
            lottieAnimation: 'assets/Animation1.json',
            bgColor: const Color(0xFF795548),
            textColor: Colors.white,
          ),
          Onboarding(
            title: 'Stay Organized',
            description: 'Quality furniture for every room, every style.',
            lottieAnimation: 'assets/Animation2.json',
            bgColor: Color.fromARGB(169, 199, 199, 164),
            textColor: const Color.fromARGB(255, 79, 148, 81),
          ),
          Onboarding(
            title: 'Achieve More',
            description: 'Reach your goals and boost productivity.',
            lottieAnimation: 'assets/Animation3.json',
            bgColor: Color(0xFFA9A9A9),
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
