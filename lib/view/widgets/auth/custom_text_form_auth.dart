import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  const CustomTextFormAuth(
      {super.key,
      required this.label,
      required this.hint,
      required this.icon,
      required this.myController,
      this.myValidator,
      required this.isNumber,
      this.hideText,
      this.onTapIcon});
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController myController;
  final String? Function(String?)? myValidator;
  final bool isNumber;
  final bool? hideText;
  final void Function()? onTapIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        obscureText: hideText == null || hideText == false ? false : true,
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: myValidator,
        controller: myController,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 14),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(label)),
            suffixIcon: InkWell(
              onTap: onTapIcon,
              child: Icon(icon),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
