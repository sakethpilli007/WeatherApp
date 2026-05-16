import 'package:flutter/material.dart';

class TripsOverview extends StatelessWidget {
  const TripsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    // A clean container with no duplicate headers, Scaffolds, or SafeArea
    return const Center(
      child: Text(
        "Trips Content Screen Layout",
        style: TextStyle(
          color: Colors.white, 
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}