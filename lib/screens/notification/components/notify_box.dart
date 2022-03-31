import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../res/app_colors.dart';
import '../../../res/app_images.dart';

class NotifyBoxWidget extends StatelessWidget {
  final bool? isShadow;
  final String? titleText;
  final String? timeText;
  final Color? notificationColor;

  const NotifyBoxWidget({Key? key,
    this.isShadow = true,
    this.titleText = 'Title Text',
    this.timeText = '5 minutes ago',
    this.notificationColor = AppColors.yellowNewColor,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: isShadow == true ? AppColors.shadowColor.withOpacity(0.04) : Colors.white,
            blurRadius: 11.0,
            offset: const Offset(0.0, 15.0),
          ),
          BoxShadow(
            color: isShadow == true ? AppColors.shadowColor.withOpacity(0.03) : Colors.white,
            blurRadius: 4.0,
            offset: const Offset(0.0, -2.0),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.0),
              image: const DecorationImage(
                image: AssetImage(AppImages.personImage),
              ),
            ),
          ),
          const SizedBox(width: 13.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(titleText!,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyDarkColor,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(timeText!,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyToggleColor,
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(AppImages.yellowNotification, color: notificationColor),
        ],
      ),
    );
  }
}
