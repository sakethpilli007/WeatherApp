import 'package:flutter/material.dart';
// 1. Keep your import so this file can see the TripsOverview widget
import 'trips_overview.dart'; 

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({super.key});

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1d273a),
      body: SafeArea(
        child: Column(
          children: [
            // The Pill Button stays perfectly still at the top
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: SlidingPillControl(
                options: const ['Forecast', 'Trips'],
                selectedIndex: _selectedIndex,
                onChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),

            // Only the content inside the PageView will slide left/right
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                children: [
                  // PAGE 1: Your Forecast Content View
                  // (Replace this Center widget with whatever your weather layout is!)
                  const Center(
                    child: Text(
                      "Forecast Content View",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),

                  // PAGE 2: Your actual Trips screen content hooked up directly
                  const TripsOverview(), 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Keep your SlidingPillControl class code right here ---
class SlidingPillControl extends StatelessWidget {
  final List<String> options;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const SlidingPillControl({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const double width = 240.0;
    const double height = 45.0;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            alignment: Alignment(selectedIndex == 0 ? -1.0 : 1.0, 0.0),
            child: Container(
              width: width / options.length,
              height: height,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(height / 2),
                border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
              ),
            ),
          ),
          Row(
            children: List.generate(options.length, (index) {
              final isSelected = index == selectedIndex;
              return Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onChanged(index),
                  child: Center(
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 200),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.white.withOpacity(0.4),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      child: Text(options[index]),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}