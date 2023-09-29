import 'package:flutter/material.dart';
import 'package:admin/core/constants/color.dart';

class CustomBottomAppBar extends StatelessWidget {
  final void Function() onPressed;
  final IconData? iconData;
  final String textButton;
  final bool active;
  const CustomBottomAppBar(
      {super.key,
      required this.onPressed,
      this.iconData,
      required this.textButton,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData,
              color: active == true ? AppColor.primaryColor : AppColor.grey2),
          Text(
            textButton,
            style: TextStyle(
                color: active == true ? AppColor.primaryColor : AppColor.grey2),
          ),
        ],
      ),
    );
  }
}
