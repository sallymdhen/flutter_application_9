import 'package:flutter/material.dart';

class IconBack extends StatelessWidget {
  const IconBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child:Icon(Icons.arrow_back) ,
      




    );
  }
}