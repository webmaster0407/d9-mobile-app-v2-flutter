import 'package:delivery_app/res/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../res/app_colors.dart';


class JobWidget extends StatelessWidget {
  final String? iconPath;
  final String? jobText;
  final String? jobDescText;

  const JobWidget({Key? key,
    this.iconPath = AppImages.pendingJobIcon,
    this.jobText = '102',
    this.jobDescText = 'Pending jobs',
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(iconPath!),
        Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 4.0),
          child: Text(jobText!,
            style: const TextStyle(
              color: AppColors.mainOneColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Manrope',
            ),
          ),
        ),
        Text(jobDescText!,
          style: const TextStyle(
            color: AppColors.greyColor,
            fontSize: 10.0,
            fontWeight: FontWeight.w400,
            fontFamily: 'Manrope',
          ),
        ),
      ],
    );
  }
}
