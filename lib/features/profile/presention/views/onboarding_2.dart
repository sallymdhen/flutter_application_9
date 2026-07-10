import 'package:flutter/material.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

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
              'assets/images/onboarding_2.png',
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
            "Let's Start Journey",
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
              'Smart, Gorgeous & Fashionable\nCollection Explor Now',
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
