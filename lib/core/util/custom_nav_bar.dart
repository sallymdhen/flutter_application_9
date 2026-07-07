import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_9/core/util/app_colors.dart';
import 'package:flutter_application_9/core/util/app_icons.dart';
import 'package:flutter_application_9/core/util/responsive_util.dart';
import 'package:flutter_application_9/features/home/presention/views/cart_screen.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTabTap;

  const CustomNavBar({
    super.key,
    this.currentIndex = 0,
    this.onTabTap,
  });

  Widget _navIcon(BuildContext context, int index, IconData icon, double height) {
    final bool isActive = index == currentIndex;
    return GestureDetector(
      onTap: () {
        if (onTabTap != null) onTabTap!(index);

       
        switch (index) {
          case 0:
           
            // Navigator.pushNamed(context, '/home_screen');
            break;
          case 1:
            
            // Navigator.pushNamed(context, '/favorite');
            break;
          case 2:
           
            // Navigator.pushNamed(context, '/notifications');
            break;
          case 3:
            
            // Navigator.pushNamed(context, '/profile');
            break;
        }
      },
      child: Icon(
        icon,
        size: scale(context, height),
        // الأيقونة النشطة تصبح خضراء، وباقي الأيقونات تظل رمادية
        color: isActive ? AppColors.primaryGreen : AppColors.greyColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SizedBox(
        height: scale(context, 106),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width, scale(context, 106)),
              painter: _NavBarShapePainter(),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: scale(context, 52),
                left: scale(context, 31),
                right: scale(context, 31),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _navIcon(context, 0, Icons.home, 24),
                  _navIcon(context, 1, Icons.favorite_border, 24),
                  SizedBox(width: scale(context, 56)),
                  _navIcon(context, 2, Icons.notifications_none, 24),
                  _navIcon(context, 3, Icons.person_outline, 24),
                ],
              ),
            ),
            Positioned(
              top: -scale(context, 8),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                  );
                },
                child: Container(
                  width: scale(context, 56),
                  height: scale(context, 56),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryGreen,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppIcons.bag2,
                      width: scale(context, 24),
                      height: scale(context, 24),
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
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

class _NavBarShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.whiteColor
      ..style = PaintingStyle.fill;

    final shadowPaint = Paint()
      ..color = const Color(0xFF83AAD1).withOpacity(0.12)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

    final double centerX = size.width / 2;
    final double notchRadius = size.width * (56 / 375) / 2 + size.width * 0.03;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(centerX - notchRadius * 2, 0);
    path.quadraticBezierTo(
      centerX - notchRadius, 0,
      centerX - notchRadius, notchRadius * 0.6,
    );
    path.arcToPoint(
      Offset(centerX + notchRadius, notchRadius * 0.6),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );
    path.quadraticBezierTo(
      centerX + notchRadius, 0,
      centerX + notchRadius * 2, 0,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}