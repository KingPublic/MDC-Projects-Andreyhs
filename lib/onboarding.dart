import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'login.dart';

class Onboarding {
  final String title;
  final String description;
  final String lottieAnimation;
  final Color bgColor;
  final Color textColor;

  Onboarding({
    required this.title,
    required this.description,
    required this.lottieAnimation,
    this.bgColor = const Color.fromARGB(255, 107, 147, 180),
    this.textColor = Colors.white,
  });
}

class OnboardingPage extends StatefulWidget {
  final List<Onboarding> pages;

  const OnboardingPage({Key? key, required this.pages}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  // Store the currently visible page
  int _currentPage = 0;
  // Define a controller for the pageview
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        color: widget.pages[_currentPage].bgColor,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                // Pageview to render each page
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.pages.length,
                  onPageChanged: (idx) {
                    // Change current page when pageview changes
                    setState(() {
                      _currentPage = idx;
                    });
                  },
                  itemBuilder: (context, idx) {
                    final _item = widget.pages[idx];
                    return Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(top:200 ,left:20 ,right:20 ),
                            child: Lottie.asset(
                              _item.lottieAnimation,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  _item.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: _item.textColor,
                                      ),
                                ),
                              ),
                              Container(
                                constraints: const BoxConstraints(maxWidth: 280),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 8.0),
                                child: Text(
                                  _item.description,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: _item.textColor,
                                      ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Current page indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.pages
                    .map((item) => AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          width: _currentPage == widget.pages.indexOf(item)
                              ? 20
                              : 4,
                          height: 4,
                          margin: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                        ))
                    .toList(),
              ),

              // Bottom buttons
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Tombol Skip
                    TextButton(
                      onPressed: () {
                        // Logika untuk tombol Skip (tetap di halaman onboarding)
                        _pageController.jumpToPage(widget.pages.length - 1);
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
      // Tombol Next/Finish
                    TextButton(
                      onPressed: () {
                        if (_currentPage == widget.pages.length - 1) {
                          // Jika di halaman terakhir, navigasikan ke halaman login
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(), // Halaman login Anda
                            ),
                          );
                        } else {
                          // Jika belum di halaman terakhir, pindah ke halaman berikutnya
                          _pageController.animateToPage(
                            _currentPage + 1,
                            curve: Curves.easeInOutCubic,
                            duration: const Duration(milliseconds: 250),
                          );
                        }
                      },
                      child: Text(
                        _currentPage == widget.pages.length - 1
                            ? "Finish"
                            : "Next",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      
    );
  }
}

