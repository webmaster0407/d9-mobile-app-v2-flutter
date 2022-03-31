import 'package:delivery_app/res/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../res/app_colors.dart';

class FilterSearchItem extends StatelessWidget {
  final VoidCallback? onTap;
  final String? itemText;
  final String? iconPath;

  const FilterSearchItem({Key? key,
    this.onTap,
    this.itemText = 'Pickup',
    this.iconPath = AppImages.upwardIcon,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50.0,
          width: width,
          margin: const EdgeInsets.only(left: 16.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.greyColor.withOpacity(0.2),
                width: 1.0,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(iconPath!),
              const SizedBox(width: 12.0),
              Text(itemText!,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textThreeColor,
                  fontFamily: 'Manrope',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
