import 'package:flutter/material.dart';
import 'package:admin/core/constants/image_asset.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageAsset.logo,
      height: 150,
    );
  }
}
