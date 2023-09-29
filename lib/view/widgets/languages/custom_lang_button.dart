import 'package:flutter/material.dart';

import '../../../core/constants/color.dart';


class CustomLangButton extends StatelessWidget {
  const CustomLangButton(
      {super.key, required this.textButton, required this.onPressed});
  final String textButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primaryColor,
        onPressed: onPressed,
        child: Text(
          textButton,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
