import 'package:flutter/material.dart';

double scale(BuildContext context, double figmaValue) {
  double screenWidth = MediaQuery.of(context).size.width;
  return figmaValue * (screenWidth / 375);
}