import 'package:flutter/material.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          SizedBox(
            height: 130,
            child: Image.asset(
              'assets/images/onboarding_3.png',
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.image_outlined,
                    color: Colors.white24,
                    size: 40,
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          const Text(
            'You Have The\nPower To',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: Text(
              'There Are Many Beautiful And Attractive\nPlants To Your Room',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade400,
                height: 1.6,
              ),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
