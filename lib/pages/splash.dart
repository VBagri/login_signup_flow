import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'register.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentIndex = 0; // Tracks the current swipe option (0 = Register, 1 = Sign In)

  // Custom page transition function
  Route _createPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Start from right
        const end = Offset.zero; // End at the center
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  // Function to navigate with delay after tapping on an option
  void navigateWithDelay(Widget screen) {
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.push(
        context,
        _createPageRoute(screen), // Custom transition
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg2.jpg'), // Path to your background image
            fit: BoxFit.cover, // Ensures the image covers the entire screen
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Larger Lottie Animation
              Expanded(
                flex: 3,
                child: Lottie.asset(
                  'animation/splash.json', // Replace with your Lottie file path
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),

              // Title
              const Text(
                'Discover your\nDream Job Here',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  height: 1.2,
                  color: Color.fromARGB(255, 0, 0, 0), // White text for contrast
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Subtitle
              Text(
                'Explore all the most exciting job roles\nbased on your interest and study major',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  color: Colors.grey[600], // Slightly faded white color for subtitle
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Swipeable Container for Register and Sign In
              Container(
                width: double.infinity,
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Animated indicator
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 300),
                      alignment: currentIndex == 0
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5 - 40,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    // GestureDetector for swiping
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = 0; // Set to Register
                              });
                              // Delay before navigating to Register screen
                              navigateWithDelay(RegisterScreen());
                            },
                            child: Center(
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: currentIndex == 0
                                      ? Colors.black
                                      : Colors.grey[600],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = 1; // Set to Sign In
                              });
                              // Delay before navigating to Sign In screen
                              navigateWithDelay(SignInScreen());
                            },
                            child: Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: currentIndex == 1
                                      ? Colors.black
                                      : Colors.grey[600],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
