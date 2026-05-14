import 'package:flutter/material.dart';
import 'trips_overview.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ElevatedButton(style: ButtonStyle(), child: const Text("next screen"),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TripsOverview()),
            );
          }),
          
        ),
      );
  }
}


