import 'package:delivery_app/screens/job_history/job_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../res/app_colors.dart';
import '../../../../../../res/app_images.dart';
import 'progress_widget.dart';

class ShiftBox extends StatelessWidget {
  final bool? isActiveOne;
  final bool? isActiveTwo;
  final bool? isActiveThree;
  final bool? isActiveFour;

  const ShiftBox({Key? key,
    this.isActiveOne = true,
    this.isActiveTwo = false,
    this.isActiveThree = false,
    this.isActiveFour = false,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
      padding: const EdgeInsets.only(left: 12.0, top: 11.0, bottom: 16.0, right: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: AppColors.sideBoxColor.withOpacity(0.8),
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.greySColor.withOpacity(0.1),
            blurRadius: 32.0,
            spreadRadius: 2.0,
            offset: const Offset(0.0, 4.0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(AppImages.upwardIcon),
              const SizedBox(width: 8.0),
              const Text('FDGFSDSH',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              const Text('Late by 30 mins',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Material(
            color: Colors.white,
            child: InkWell(
              onTap: (){
                Get.to(JobHistoryScreen());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.greyColor.withOpacity(0.3),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('971 S Pioneer Rd,Town	Beulah',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textThreeColor,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined, color: AppColors.textThreeColor, size: 16.0),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProgressWidget(
                text: 'Not Strated',
                textColor: isActiveOne == true ? AppColors.notStartColor : AppColors.greyColor,
                countText: '1',
              ),
              ProgressWidget(
                text: 'In Progress',
                textColor: isActiveTwo == true ? AppColors.mainColor : AppColors.greyColor,
                countText: '2',
              ),
              ProgressWidget(
                text: 'Completed',
                textColor: isActiveThree == true ? AppColors.warningSkyColor : AppColors.greyColor,
                countText: '3',
              ),
              ProgressWidget(
                text: 'Failed',
                textColor: isActiveFour == true ? AppColors.warningColor : AppColors.greyColor,
                countText: '4',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
