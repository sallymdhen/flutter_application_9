import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_application_9/core/util/app_colors.dart';
import 'package:flutter_application_9/core/util/app_fonts.dart';
import 'package:flutter_application_9/core/util/responsive_util.dart';

class CartItemCard extends StatelessWidget {
  final String id;
  final String imagePath;
  final String name;
  final double price;
  final int quantity;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onDelete;

  const CartItemCard({
    super.key,
    required this.id,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.quantity,
    required this.onQuantityChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(id),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 58 / 335,
        children: [
          CustomSlidableAction(
            onPressed: (_) {},
            backgroundColor: AppColors.primaryGreen,
            padding: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => onQuantityChanged(quantity + 1),
                  child: Icon(
                    Icons.add,
                    color: AppColors.whiteColor,
                    size: scale(context, 18),
                  ),
                ),
                SizedBox(height: scale(context, 8)),
                Text(
                  '$quantity',
                  style: TextStyle(
                    fontFamily: AppFonts.poppins,
                    fontWeight: FontWeight.w500,
                    fontSize: scale(context, 14),
                    color: AppColors.whiteColor,
                  ),
                ),
                SizedBox(height: scale(context, 8)),
                GestureDetector(
                  onTap: () {
                    if (quantity > 1) {
                      onQuantityChanged(quantity - 1);
                    }
                  },
                  child: Icon(
                    Icons.remove,
                    color: AppColors.whiteColor,
                    size: scale(context, 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 58 / 335,
        children: [
          CustomSlidableAction(
            onPressed: (_) => onDelete(),
            backgroundColor: AppColors.redColor,
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.delete_outline,
              color: AppColors.whiteColor,
              size: scale(context, 20),
            ),
          ),
        ],
      ),
      child: Container(
        height: scale(context, 104),
        padding: EdgeInsets.symmetric(horizontal: scale(context, 20)),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(scale(context, 8)),
        ),
        child: Row(
          children: [
            SizedBox(
              width: scale(context, 87),
              height: scale(context, 85),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: scale(context, 16)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: AppFonts.raleway,
                      fontWeight: FontWeight.w500,
                      fontSize: scale(context, 13),
                      height: 20 / 13,
                      letterSpacing: 0,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: scale(context, 8)),
                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontFamily: AppFonts.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: scale(context, 14),
                      height: 1.0,
                      letterSpacing: 0,
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}