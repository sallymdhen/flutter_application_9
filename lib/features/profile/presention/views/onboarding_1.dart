import 'package:flutter/material.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

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
              'assets/images/onboarding_1.png',
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
            'WELLCOME TO\nBYTE BOUTIQUE',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.3,
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
