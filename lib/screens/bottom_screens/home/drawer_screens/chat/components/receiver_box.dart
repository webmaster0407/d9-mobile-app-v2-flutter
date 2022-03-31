import 'package:flutter/material.dart';

import '../../../../../../res/app_colors.dart';


class ReceiverBox extends StatelessWidget {
  final String? nameText;
  final String? msgText;
  final String? timeText;
  final bool? isName;
  final bool? isImage;
  final Widget? image;

  const ReceiverBox({Key? key,
    this.isName = false,
    this.isImage = false,
    this.nameText = 'Devo Mizuhara',
    this.msgText = 'But don’t worry cause we are all learning here',
    this.timeText = '16:46',
    this.image,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(top: 24.0, left: 16.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(18.0),
          topLeft: Radius.circular(18.0),
          bottomRight: Radius.circular(18.0),
        ),
        color: AppColors.greyLightLColor.withOpacity(0.6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          isName == true ? Text(nameText!,
            style: const TextStyle(
              fontSize: 12.0,
              color: AppColors.mainColor,
              fontWeight: FontWeight.w600,
            ),
          ) : const SizedBox(),
          const SizedBox(height: 3.0),
          isImage == false ? Text(msgText!,
            style: const TextStyle(
              fontSize: 14.0,
              color: AppColors.textThreeColor,
              fontWeight: FontWeight.w400,
              fontFamily: 'Manrope',
            ),
          ) : image!,
          const SizedBox(height: 3.0),
          Text(timeText!,
            style: const TextStyle(
              fontSize: 10.0,
              color: AppColors.greyColor,
              fontWeight: FontWeight.w400,
              fontFamily: 'Manrope',
            ),
          ),
        ],
      ),
    );
  }
}
