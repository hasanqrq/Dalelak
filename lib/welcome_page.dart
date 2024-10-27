import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'welcome_bloc.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeBloc(),
      child: Scaffold(
        body: Stack(
          children: [
            // Background image of Petra
            Positioned.fill(
              child: Image.asset(
                'assets/images/petra_background.jpg.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            // Overlay for text and buttons
            Positioned.fill(
              child: Container(
                color:
                    Colors.black.withOpacity(0.4), // Semi-transparent overlay
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome to Jordan',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Dalelak app for tourist places in Jordan',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Choose the region to start exploring the country',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    // Buttons for each region
                    BlocBuilder<WelcomeBloc, WelcomeState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            _buildRegionButton(
                                context, 'North', Colors.blueAccent),
                            const SizedBox(height: 10),
                            _buildRegionButton(
                                context, 'Middle', Colors.greenAccent),
                            const SizedBox(height: 10),
                            _buildRegionButton(
                                context, 'South', Colors.orangeAccent),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for creating region buttons
  Widget _buildRegionButton(BuildContext context, String region, Color color) {
    return ElevatedButton(
      onPressed: () {
        // Triggering the event to select the region
        context.read<WelcomeBloc>().add(SelectRegion(region));

        // Navigate to the main page, passing the selected region as an argument
        Navigator.pushNamed(
          context,
          '/main',
          arguments: region, // Passing region as an argument to the main page
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
      child: Text(
        region,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
