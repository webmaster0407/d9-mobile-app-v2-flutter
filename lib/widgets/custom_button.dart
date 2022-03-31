import 'package:flutter/material.dart';

import '../res/app_colors.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final double? fontSize;
  final String? btnText;
  final Color? btnColor;
  final Color? fontColor;
  final Color? borderColor;
  final VoidCallback? onTap;
  final double? margin;

  const CustomButton({Key? key,
    this.width,
    this.height = 50.0,
    this.radius = 6.0,
    this.fontSize = 17.0,
    this.btnText = '',
    this.fontColor = Colors.white,
    this.btnColor = AppColors.mainColor,
    required this.onTap,
    this.margin = 0.0,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: margin!),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width ?? MediaQuery.of(context).size.width, height!),
          primary: btnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!),
          ),
          side: BorderSide(
            color: borderColor ?? btnColor!,
            width: 1.0,
          ),
        ),
        onPressed: onTap,
        child: Text(btnText!,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
