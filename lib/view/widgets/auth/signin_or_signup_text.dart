import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/color.dart';

class SignInOrSignUpText extends StatelessWidget {
  const SignInOrSignUpText(
      {super.key,
      required this.textOne,
      required this.textTwo,
      required this.onTap});
  final String textOne;
  final String textTwo;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textOne.tr,
          style: const TextStyle(color: AppColor.grey),
        ),
        const SizedBox(
          width: 7,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            textTwo.tr,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
