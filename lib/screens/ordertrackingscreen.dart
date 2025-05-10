import 'package:flutter/material.dart';
import '../main.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Tracking"),
      ),
      body: Column(
        children: [
          //tracking steps
          Container(
  color: ayooPink.withAlpha(128), // ✅ 50% opacity
  height: 100,
  alignment: Alignment.center,
  child: const Text(
    "Tracking steps",
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
  ),
),

          const SizedBox(height: 10,),
          //Rider info
          Container(
  color: ayooPink.withAlpha(128), // 128 is ~50% opacity (255 * 0.5)
  height: 50,
  alignment: Alignment.center,
  child: const Text(
    "Rider info",
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  ),
),

          const SizedBox(height: 10,),
          //Estimated delivery time
          Container(
            color: ayooPink.withOpacity(0.5),
            height: 50,
            child: const Center(child: Text("Estimated delivery time")),
          ),
           const SizedBox(height: 10,),
          //Contact options
          Container(
            color: ayooPink.withOpacity(0.5),
            height: 50,
            child: const Center(child: Text("Contact options")),
          ),
        ],
      ),
    );
  }
}
