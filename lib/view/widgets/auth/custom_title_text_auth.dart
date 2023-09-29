import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitleTextAuth extends StatelessWidget {
  const CustomTitleTextAuth({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      style: Theme.of(context).textTheme.displayMedium,
      textAlign: TextAlign.center,
    );
  }
}
