import 'package:flutter/material.dart';
import 'CurrentWeather.dart';


class TripsOverview extends StatelessWidget {
  const TripsOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ElevatedButton(style: ButtonStyle(), child: const Text("back home"),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CurrentWeather()),
            );
          }),
          
        ),
      );
  }
}