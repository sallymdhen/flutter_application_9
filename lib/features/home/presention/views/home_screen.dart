import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/models/product_model.dart';
import 'package:flutter_application_9/core/service/api_service.dart';
import 'package:flutter_application_9/features/home/presention/views/cart_screen.dart';
import 'package:flutter_application_9/features/home/presention/views/favorite_screen.dart';
import 'package:flutter_application_9/features/home/presention/views/side_menu_view.dart'; // استيراد صفحة المينو
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_9/core/util/app_colors.dart';
import 'package:flutter_application_9/core/util/app_fonts.dart';
import 'package:flutter_application_9/core/util/app_icons.dart';
import 'package:flutter_application_9/core/util/app_images.dart';
import 'package:flutter_application_9/core/util/responsive_util.dart';
import 'package:flutter_application_9/features/home/presention/widgets/category_button.dart';
import 'package:flutter_application_9/features/home/presention/widgets/product_card.dart'; // تأكد من أن هذا هو الكرت الجديد
import 'package:flutter_application_9/features/home/presention/widgets/section_header.dart';
import 'package:flutter_application_9/widgets/custom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // كائن مفتاح للتحكم بالـ Drawer لفتح القائمة الجانبية من أيقونة المينو الخاصة بك
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // ربط المفتاح بالـ Scaffold
      backgroundColor: AppColors.scaffoldBg,
      drawer: const Drawer(
        child: SideMenuView(), // وضع صفحتك المينو داخل الـ Drawer
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: scale(context, 20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: scale(context, 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer(); // فتح المينو عند الضغط على الأيقونة الخاصة بك
                    },
                    child: SvgPicture.asset(
                      AppIcons.menu,
                      width: scale(context, 25.71),
                      height: scale(context, 18),
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Text(
                        'Explore',
                        style: TextStyle(
                          fontFamily: AppFonts.raleway,
                          fontWeight: FontWeight.w700,
                          fontSize: scale(context, 32),
                          color: AppColors.blackColor,
                        ),
                      ),
                      Positioned(
                        top: -scale(context, 10),
                        left: -scale(context, 10),
                        child: SvgPicture.asset(
                          AppIcons.lines,
                          width: scale(context, 18),
                          height: scale(context, 19),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CartScreen()),
                      );
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: scale(context, 44),
                          height: scale(context, 44),
                          padding: EdgeInsets.all(scale(context, 10)),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(scale(context, 40)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            color: AppColors.blackColor,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: scale(context, 8),
                            height: scale(context, 8),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.notificationRed,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: scale(context, 20)),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: scale(context, 52),
                      padding: EdgeInsets.symmetric(
                        horizontal: scale(context, 20),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(scale(context, 14)),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: scale(context, 24),
                            color: AppColors.greyColor,
                          ),
                          SizedBox(width: scale(context, 12)),
                          Text(
                            'Looking for ......',
                            style: TextStyle(
                              fontFamily: AppFonts.poppins,
                              fontWeight: FontWeight.w500,
                              fontSize: scale(context, 12),
                              color: AppColors.greyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: scale(context, 12)),
                  Container(
                    width: scale(context, 52),
                    height: scale(context, 52),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryGreen,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppIcons.sliders,
                        width: scale(context, 24),
                        height: scale(context, 24),
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: scale(context, 20)),
              Text(
                'Select Category',
                style: TextStyle(
                  fontFamily: AppFonts.raleway,
                  fontWeight: FontWeight.w600,
                  fontSize: scale(context, 16),
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(height: scale(context, 12)),
              Row(
                children: [
                  Expanded(
                    child: CategoryButton(label: 'man', onTap: () {}),
                  ),
                  SizedBox(width: scale(context, 8)),
                  Expanded(
                    child: CategoryButton(label: 'woman', onTap: () {}),
                  ),
                  SizedBox(width: scale(context, 8)),
                  Expanded(
                    child: CategoryButton(label: 'child', onTap: () {}),
                  ),
                ],
              ),
              SizedBox(height: scale(context, 20)),
              SectionHeader(title: 'Popular T-shirt', onSeeAllTap: () {}),
              SizedBox(height: scale(context, 12)),

              FutureBuilder<List<ProductModel>>(
                future: ApiService.getAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: scale(context, 40)),
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  }

                  if (snapshot.hasError) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: scale(context, 20)),
                      child: Text('حصل خطأ بتحميل المنتجات: ${snapshot.error}'),
                    );
                  }

                  final products = snapshot.data ?? [];
                  if (products.length < 2) {
                    return const SizedBox.shrink();
                  }

                  final product1 = products[0];
                  final product2 = products[1];

                  // تم تعديل هذا الجزء ليتوافق مع الـ ProductCard الجديد
                  return Row(
                    children: [
                      Expanded(
                        child: ProductCard(
                          product: product1,
                          // لا نحتاج لتمرير isInitiallyFavorite أو onFavoriteToggle أو onAddTap
                        ),
                      ),
                      SizedBox(width: scale(context, 12)),
                      Expanded(
                        child: ProductCard(
                          product: product2,
                          // لا نحتاج لتمرير parameters إضافية
                        ),
                      ),
                    ],
                  );
                },
              ),

              SizedBox(height: scale(context, 20)),
              SectionHeader(title: 'New Arrivals', onSeeAllTap: () {}),
              SizedBox(height: scale(context, 12)),
              Container(
                width: scale(context, 335),
                height: scale(context, 95),
                padding: EdgeInsets.all(scale(context, 12)),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(scale(context, 16)),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Summer Sale',
                          style: TextStyle(
                            fontFamily: AppFonts.raleway,
                            fontWeight: FontWeight.w500,
                            fontSize: scale(context, 12),
                            color: AppColors.darkGrey,
                          ),
                        ),
                        Text(
                          '15% OFF',
                          style: TextStyle(
                            fontFamily: AppFonts.jost,
                            fontWeight: FontWeight.w900,
                            fontSize: scale(context, 36),
                            letterSpacing: -0.02,
                            color: AppColors.purpleColor,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: scale(context, 10),
                      top: scale(context, -20),
                      child: Transform.rotate(
                        angle: 0.25,
                        child: SizedBox(
                          width: scale(context, 99),
                          height: scale(context, 99),
                          child: Image.asset(
                            AppImages.tshirt3,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: scale(context, 176),
                      top: scale(context, 12),
                      child: Transform.rotate(
                        angle: -0.0508,
                        child: SvgPicture.asset(
                          AppIcons.newBadge,
                          width: scale(context, 26),
                          height: scale(context, 26),
                        ),
                      ),
                    ),
                    Positioned(
                      left: scale(context, 8),
                      top: scale(context, 60),
                      child: Transform.rotate(
                        angle: 3.14,
                        child: SvgPicture.asset(
                          AppIcons.sparkle,
                          width: scale(context, 15.48),
                          height: scale(context, 16.73),
                        ),
                      ),
                    ),
                    Positioned(
                      left: scale(context, 130),
                      top: scale(context, 4),
                      child: Transform.rotate(
                        angle: 3.14,
                        child: SvgPicture.asset(
                          AppIcons.sparkle,
                          width: scale(context, 15.48),
                          height: scale(context, 16.73),
                        ),
                      ),
                    ),
                    Positioned(
                      left: scale(context, 158),
                      bottom: 0,
                      child: SvgPicture.asset(
                        AppIcons.sparkle,
                        width: scale(context, 15.48),
                        height: scale(context, 16.73),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: scale(context, 15),
                      child: SvgPicture.asset(
                        AppIcons.sparkle,
                        width: scale(context, 15.48),
                        height: scale(context, 16.73),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: scale(context, 20)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        onTabTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FavoriteScreen()),
            );
          }
        },
      ),
    );
  }
}