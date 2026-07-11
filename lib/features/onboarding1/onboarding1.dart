import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: Stack(
        children: [
          Positioned(
            top: 60,
            left: 40,
            child: SvgPicture.asset(
              'assets/images_svg/Highlight_05.svg',
              width: 15,
              height: 15,
            ),
          ),

          Positioned(
            top: 156,
            right: 71,
            child: SvgPicture.asset(
              'assets/images_svg/Misc_04.svg',
              width: 28,
              height: 28,
            ),
          ),

          Positioned(
            bottom: 35,
            left: 29,
            child: SvgPicture.asset(
              'assets/images_svg/Group_2.svg',
              width: 100,
              height: 100,
            ),
          ),

          Positioned(
            bottom: 80,
            right: 100,
            child: SvgPicture.asset(
              'assets/images_svg/Highlight_10.svg',
              width: 100,
              height: 100,
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'WELLCOME TO\nBYTE BOUTIQUE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 16),

                SvgPicture.asset(
                  'assets/images_svg/Vector_10.svg',
                  width: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
