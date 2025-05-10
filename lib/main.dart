import 'package:flutter/material.dart';
import 'package:myapp/screens/loginscreen.dart';
import 'package:myapp/screens/registerscreen.dart';
import 'package:myapp/screens/splashscreen.dart';
import 'package:myapp/screens/onboardingscreen.dart';
import 'package:myapp/screens/passwordrecoveryscreen.dart';
import 'package:myapp/screens/homescreen.dart';
import 'package:myapp/screens/restaurantscreen.dart';
import 'package:myapp/screens/cartscreen.dart';
import 'package:myapp/screens/checkoutscreen.dart';
import 'package:myapp/screens/ordertrackingscreen.dart';
import 'package:myapp/screens/profilescreen.dart';
import 'package:myapp/screens/orderhistoryscreen.dart';
import 'package:myapp/screens/savedaddressesscreen.dart';
import 'package:myapp/screens/addaddressscreen.dart';
// new imports
import 'package:myapp/screens/searchscreen.dart';

const ayooPink = Color(0xFFFB11C8);

void main() {
  runApp(const MyApp());
}

class Routes {
  static const String login = '/login';
  static const String register = '/register';
  static const String passwordRecovery = '/passwordRecovery';
  static const String orderHistory = '/orderHistory';
  static const String savedAddresses = '/savedAddresses';
  static const String home = '/home';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ayoo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash', // Change initialRoute here
      routes: {
        '/splash': (context) => const SplashScreen(),// Keep the splashscreen route
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/passwordRecovery': (context) => const PasswordRecoveryScreen(),
        '/restaurant': (context) => const RestaurantScreen(),
        '/cart': (context) => const CartScreen(),
        '/checkout': (context) => const CheckoutScreen(),
        '/orderTracking': (context) => const OrderTrackingScreen(),
        '/profile': (context) => const ProfileScreen(),
        Routes.orderHistory: (context) => const OrderHistoryScreen(),
        Routes.savedAddresses: (context) => const SavedAddressesScreen(),
        Routes.home: (context) => const HomeScreen(), // add the home here
        //new routes
        '/search': (context) => const SearchScreen(), // add search here
      },
      theme: ThemeData(),
    );
  }
}
