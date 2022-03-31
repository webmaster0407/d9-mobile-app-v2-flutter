import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../../../../../res/app_colors.dart';
import 'shift_box.dart';

class ShiftOneExpand extends StatelessWidget {
  const ShiftOneExpand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return ExpandablePanel(
      theme: const ExpandableThemeData(
        useInkWell: false,
        hasIcon: false,
      ),
      header: Container(
        width: width,
        color: AppColors.greyLightLColor.withOpacity(0.6),
        height: 30.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Shift 1',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Manrope',
                  color: AppColors.textThreeColor,
                ),
              ),
              Icon(Icons.keyboard_arrow_down_outlined, color: AppColors.textThreeColor,),
            ],
          ),
        ),
      ),
      collapsed: const SizedBox(),
      expanded: Container(
        width: width,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(height: 8.0),
              ShiftBox(
                isActiveOne: true,
                isActiveTwo: false,
                isActiveThree: false,
                isActiveFour: false,
              ),
              ShiftBox(
                isActiveOne: false,
                isActiveTwo: true,
                isActiveThree: false,
                isActiveFour: false,
              ),
              SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}
