import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/util/app_colors.dart';
import 'package:flutter_application_9/core/util/app_fonts.dart';
import 'package:flutter_application_9/core/util/responsive_util.dart';

class CartSummary extends StatelessWidget {
  final double subtotal;
  final double deliveryCharge;
  final VoidCallback onCheckoutTap;

  const CartSummary({
    super.key,
    required this.subtotal,
    required this.deliveryCharge,
    required this.onCheckoutTap,
  });

  double get totalCost => subtotal + deliveryCharge;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: scale(context, 20),
        vertical: scale(context, 20),
      ),
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildRow(
            context,
            title: 'Subtotal',
            value: '\$${subtotal.toStringAsFixed(2)}',
            valueColor: AppColors.blackColor,
          ),
          SizedBox(height: scale(context, 14)),
          _buildRow(
            context,
            title: 'Delivery',
            value: '\$${deliveryCharge.toStringAsFixed(2)}',
            valueColor: AppColors.blackColor,
          ),
          SizedBox(height: scale(context, 18)),
          const _DashedDivider(),
          SizedBox(height: scale(context, 16)),
          _buildRow(
            context,
            title: 'Total Cost',
            value: '\$${totalCost.toStringAsFixed(2)}',
            titleColor: AppColors.blackColor,
            valueColor: AppColors.primaryGreen,
          ),
          SizedBox(height: scale(context, 30)),
          GestureDetector(
            onTap: onCheckoutTap,
            child: Container(
              width: double.infinity,
              height: scale(context, 50),
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                borderRadius: BorderRadius.circular(scale(context, 12)),
              ),
              child: Center(
                child: Text(
                  'Checkout',
                  style: TextStyle(
                    fontFamily: AppFonts.raleway,
                    fontWeight: FontWeight.w500,
                    fontSize: scale(context, 14),
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(
    BuildContext context, {
    required String title,
    required String value,
    Color? titleColor,
    required Color valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: AppFonts.raleway,
            fontWeight: FontWeight.w500,
            fontSize: scale(context, 16),
            color: titleColor ?? AppColors.greyColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: AppFonts.poppins,
            fontWeight: FontWeight.w500,
            fontSize: scale(context, 16),
            color: valueColor,
          ),
        ),
      ],
    );
  }
}

class _DashedDivider extends StatelessWidget {
  const _DashedDivider();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 6.0;
        const dashHeight = 2.0;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();

        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.greyColor.withOpacity(0.5),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}