import 'package:delivery_app/res/app_colors.dart';
import 'package:delivery_app/res/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HelpBoxWidget extends StatelessWidget {
  final String? iconPath;
  final String? titleText;
  final String? descText;

  const HelpBoxWidget({Key? key,
    this.iconPath = AppImages.teamWorkIcon,
    this.titleText = 'What  if I switch organization?',
    this.descText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut '
        'aliquam ipsum dolor sit ame come into',
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.warningSkyColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(iconPath!),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(titleText!,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    color: AppColors.mainColor,
                    fontFamily: 'Manrope',
                  ),
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(descText!,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyColor,
                  fontFamily: 'Manrope',
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
