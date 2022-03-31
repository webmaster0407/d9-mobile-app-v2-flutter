import 'package:flutter/material.dart';

import '../../../../../../res/app_colors.dart';


class SenderBox extends StatelessWidget {
  final String? nameText;
  final String? msgText;
  final String? timeText;
  final bool? isName;

  const SenderBox({Key? key,
    this.isName = false,
    this.nameText = 'Devo Mizuhara',
    this.msgText = 'But don’t worry cause we are all learning here',
    this.timeText = '16:46',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(top: 24.0, right: 16.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(18.0),
            topLeft: Radius.circular(18.0),
            bottomLeft: Radius.circular(18.0),
          ),
          color: AppColors.mainColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            isName == true ? Text(nameText!,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ) : const SizedBox(),
            const SizedBox(height: 4.0),
            Text(msgText!,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontFamily: 'Manrope',
              ),
            ),
            const SizedBox(height: 4.0),
            Text(timeText!,
              style: const TextStyle(
                fontSize: 10.0,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontFamily: 'Manrope',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
