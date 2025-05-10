import 'package:flutter/material.dart';
import 'my_icons.dart';


// Define the data model for onboarding slides
class OnboardingSlide {
  final String title;
  final String description;
  final IconData icon;
  final String image;
  final Color bgColor;
  final Color iconColor;

  OnboardingSlide({
    required this.title,
    required this.description,
    required this.icon,
    required this.image,
    required this.bgColor,
    required this.iconColor,
  });
}

// Define the list of onboarding slides
final List<OnboardingSlide> onboardingSlides = [
  OnboardingSlide(
    title: "Fast Delivery",
    description: "Get your favorite foods delivered right to your door in minutes",
    icon: Icons.delivery_dining,
    image:
        "https://images.unsplash.com/photo-1526367790999-0150786686a2?q=80&w=500&auto=format",
    bgColor: Colors.blue.shade50,
    iconColor: Color(0xFFFB11C8),
  ),
  OnboardingSlide(
    title: "Trusted Restaurants",
    description: "Explore top-rated restaurants and dishes in your area",
    icon: Icons.star,
    image:
        "https://images.unsplash.com/photo-1600891964599-f61ba0e24092?q=80&w=500&auto=format",
    bgColor: Colors.yellow.shade100,
    iconColor: Colors.yellow.shade500,
  ),
  OnboardingSlide(
    title: "Live Tracking",
    description:
        "Track your order in real-time and know exactly when it will arrive",
    icon: Icons.map,
    image:
        "https://images.unsplash.com/photo-1596450514655-6439395148b1?q=80&w=500&auto=format",
    bgColor: Colors.blue.shade100,
    iconColor: Colors.blue.shade500,
  ),
];

// Custom Button Widget
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final bool isGhost;
  final Widget? child;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.child,
    this.isGhost = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isGhost
        ? TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              foregroundColor: textColor ?? Colors.grey.shade500,
            ),
            child: Text(text),
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: color ?? Color(0xFFFB11C8),
              foregroundColor: textColor ?? Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: child ?? Text(text),
          );
  }
}

// Mobile Layout Component
class MobileLayout extends StatelessWidget {
  final Widget child;
  final bool hideNavigation;
  final String? className;

  const MobileLayout({
    Key? key,
    required this.child,
    this.hideNavigation = false,
    this.className,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.grey.shade100,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              Expanded(child: child),
              if (!hideNavigation) const BottomNavigation(),
            ],
          ),
        ),
      ),
    ));
  }
}

// Bottom Navigation Component
class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
      ],
    );
  }
}

// Onboarding Screen Widget
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);
  static const routeName = '/onboarding';
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var slide in onboardingSlides) {
      precacheImage(NetworkImage(slide.image), context);
    }
  }

  int activeSlide = 0;

  // Method to navigate to the next slide or login screen
  void nextSlide() {
    if (activeSlide < onboardingSlides.length - 1) {
      setState(() {
        activeSlide++;
      });
    } else {
      Navigator.of(context).pushNamed('/login'); // Navigate to the login screen
    }
  }

  // Method to skip the onboarding process and navigate to the login screen
  void skip() {
    Navigator.of(context).pushNamed('/login'); // Navigate to the login screen
  }

  @override
  Widget build(BuildContext context) {
    final currentSlide = onboardingSlides[activeSlide];

    return MobileLayout(
      hideNavigation: true,
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              // Image section
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Stack(
                  children: [
                    Image.network(
                      currentSlide.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    // Gradient overlay
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 64,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.white,
                              Colors.white.withAlpha(0)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Content section
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Slide indicators
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: onboardingSlides.asMap().entries.map((entry) {
                          int index = entry.key;
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            width: index == activeSlide ? 24.0 : 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: index == activeSlide
                                  ? Colors.blue
                                  : Colors.grey.shade200,
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20.0),
                      // Icon, title, and description
                      Column(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: currentSlide.bgColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Icon(
                              currentSlide.icon,
                              size: 32,
                              color: currentSlide.iconColor,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            currentSlide.title,
                            style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            currentSlide.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                      // Buttons
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            text: "Skip",
                            onPressed: skip,
                            isGhost: true,
                          ),
                          CustomButton(
                            text: activeSlide < onboardingSlides.length - 1
                                ? "Next"
                                : "Get Started",
                            onPressed: nextSlide,
                            color: Colors.blue,
                            child: activeSlide < onboardingSlides.length - 1
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Next'),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      )
                                    ],
                                  )
                                : null,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
