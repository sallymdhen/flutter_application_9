import 'package:flutter/material.dart';
import 'package:flutter_application_9/features/profile/presention/views/profile.dart';
import '../../../../core/util/app_colors.dart';
import '../../../../core/util/app_icons.dart';
import '../../../../core/util/responsive_util.dart';
import '../widgets/menu_header.dart';
import '../widgets/menu_item_tile.dart';
import '../../presention/views/cart_screen.dart'; 
import '../../presention/views/favorite_screen.dart';

class SideMenuView extends StatelessWidget {
  const SideMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue, 
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: scale(context, 28), 
            right: scale(context, 28),
            top: scale(context, 30),
            bottom: scale(context, 20), 
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MenuHeader(),
              
              SizedBox(height: scale(context, 30)), 

              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    MenuItemTile(
                      icon: Icons.person_outline, 
                      title: 'Profile',
                      onTap: () { 
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Profile()),
                        );
                        
                      },
                    ),
                    MenuItemTile(
                      icon: AppIcons.bag2,
                      title: 'My Cart',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CartScreen()),
                        );
                      },
                    ),
                    MenuItemTile(
                      icon: Icons.favorite_border,
                      title: 'Favorite',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FavoriteScreen()),
                        );
                      },
                    ),
                    MenuItemTile(
                      icon: AppIcons.car, 
                      title: 'Orders',
                      onTap: () {},
                    ),
                    MenuItemTile(
                      icon: Icons.notifications_none, 
                      title: 'Notifications',
                      onTap: () {},
                    ),
                    MenuItemTile(
                      icon: Icons.settings_outlined, 
                      title: 'Settings',
                      onTap: () {},
                    ),
                    
                    SizedBox(height: scale(context, 15)),
                    
                    Container(
                      height: scale(context, 2),
                      width: scale(context, 308),
                      color: const Color(0xFFF7F7F7).withOpacity(0.2), 
                    ),
                    
                    SizedBox(height: scale(context, 15)),
                    
                    MenuItemTile(
                      icon: AppIcons.signOut, 
                      title: 'Sign Out',
                      showArrow: false, 
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}