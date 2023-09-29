import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBodyTextAuth extends StatelessWidget {
  const CustomBodyTextAuth({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        text.tr,
        style: Theme.of(context).textTheme.bodyLarge!,
        textAlign: TextAlign.center,
      ),
    );
  }
}
