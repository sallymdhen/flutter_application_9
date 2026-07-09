import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/util/app_colors.dart';
import 'package:flutter_application_9/core/util/responsive_util.dart';
import 'package:flutter_application_9/features/home/presention/widgets/cart_app_bar.dart';
import 'package:flutter_application_9/features/home/presention/widgets/cart_item_card.dart';
import 'package:flutter_application_9/features/home/presention/widgets/cart_summary.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> _cartItems = [
    {
      'id': '1',
      'name': 'Programmer T-shirt',
      'imagePath': 'assets/images/tshirt1.png',
      'price': 584.95,
      'quantity': 1,
    },
    {
      'id': '2',
      'name': 'Programmer T-shirt',
      'imagePath': 'assets/images/tshirt2.png',
      'price': 94.05,
      'quantity': 1,
    },
    {
      'id': '3',
      'name': 'Programmer T-shirt',
      'imagePath': 'assets/images/tshirt3.png',
      'price': 74.95,
      'quantity': 1,
    },
  ];

  final double _deliveryCharge = 60.20;

  double get _subtotal {
    return _cartItems.fold(
      0.0,
      (sum, item) => sum + (item['price'] * item['quantity']),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: scale(context, 20)),
                children: [
                  SizedBox(height: scale(context, 20)),
                  CartAppBar(
                    itemCount: _cartItems.length,
                    onBackTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: scale(context, 20)),
                  Column(
                    children: List.generate(_cartItems.length, (index) {
                      final item = _cartItems[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index == _cartItems.length - 1
                              ? 0
                              : scale(context, 14),
                        ),
                        child: CartItemCard(
                          id: item['id'],
                          name: item['name'],
                          imagePath: item['imagePath'],
                          price: item['price'],
                          quantity: item['quantity'],
                          onQuantityChanged: (newQuantity) {
                            setState(() {
                              item['quantity'] = newQuantity;
                            });
                          },
                          onDelete: () {
                            setState(() {
                              _cartItems.removeAt(index);
                            });
                          },
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: scale(context, 20)),
                ],
              ),
            ),
            Container(
              color: AppColors.whiteColor,
              child: CartSummary(
                subtotal: _subtotal,
                deliveryCharge: _deliveryCharge,
                onCheckoutTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}