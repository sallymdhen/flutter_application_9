import 'package:flutter/material.dart';

class OnboardingData {
  final List<String> titleLines;
  final String? subtitle;
  final String buttonText;
  final Widget? underTitleFlourish;

  const OnboardingData({
    required this.titleLines,
    required this.buttonText,
    this.subtitle,
    this.underTitleFlourish,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  late final List<OnboardingData> _pages = [
    OnboardingData(
      titleLines: const ['WELLCOME TO', 'BYTE BOUTIQUE'],
      buttonText: 'Get Started',
    ),
    OnboardingData(
      titleLines: const ["Let's Start Journey"],
      subtitle: 'Smart, Gorgeous & Fashionable\nCollection Explor Now',
      buttonText: 'Next',
    ),
    OnboardingData(
      titleLines: const ['You Have The', 'Power To'],
      subtitle: 'There Are Many Beautiful And Attractive\nPlants To Your Room',
      buttonText: 'Next',
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goNext() {
    if (_currentPage < _pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF282828),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemBuilder: (context, index) {
                  return OnboardingPage(data: _pages[index]);
                },
              ),
            ),
            PageIndicator(count: _pages.length, currentIndex: _currentPage),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 0, 28, 24),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFECECEC),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: _goNext,
                  child: Text(
                    _pages[_currentPage].buttonText,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;

  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          const Spacer(),
          Text(
            data.titleLines.join('\n'),
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.3,
            ),
          ),
          if (data.underTitleFlourish != null) ...[
            const SizedBox(height: 6),
            data.underTitleFlourish!,
          ],
          if (data.subtitle != null) ...[
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: Text(
                data.subtitle!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade400,
                  height: 1.6,
                ),
              ),
            ),
          ],
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;

  const PageIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final bool isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          height: 4,
          width: isActive ? 24 : 16,
          decoration: BoxDecoration(
            color: isActive ? Colors.white : const Color(0xFF34C759),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
