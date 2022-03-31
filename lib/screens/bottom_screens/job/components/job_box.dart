import 'package:delivery_app/res/app_images.dart';
import 'package:delivery_app/screens/bottom_screens/job/job_detail/job_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../res/app_colors.dart';

class JobBox extends StatelessWidget {
  final String? iconPath;
  final String? timeText;

  const JobBox({Key? key,
    this.iconPath = AppImages.upwardIcon,
    this.timeText = 'Late by 30 mins',
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      padding: const EdgeInsets.only(left: 12.0, top: 11.0, bottom: 8.0, right: 12.0),
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
              SvgPicture.asset(iconPath!),
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
              Text(timeText!,
                style: const TextStyle(
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
                Get.to(const JobDetailScreen());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
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
        ],
      ),
    );
  }
}
