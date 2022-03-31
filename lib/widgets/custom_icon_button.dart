import 'package:flutter/material.dart';

import '../res/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? btnColor;
  final VoidCallback? onTap;
  final EdgeInsets? margin;
  final Widget? icon;

  const CustomIconButton({Key? key,
    this.width = 40.0,
    this.height = 40.0,
    this.btnColor = AppColors.mainColor,
    required this.onTap,
    this.margin,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(0.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width!, height!),
          primary: btnColor,
          shape: const CircleBorder(),
        ),
        onPressed: onTap,
        child: icon,
        ),
    );
  }
}

