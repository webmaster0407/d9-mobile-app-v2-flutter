import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../widgets/utils.dart';
import '../auth/signin/signin_screen.dart';
import 'controller/landing_controller.dart';

class LandingScreen extends GetView<LandingController> {
  LandingScreen({Key? key}) : super(key: key);

  final LandingController landingController = Get.put(LandingController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: 3,
              onPageChanged: (index){
                landingController.currentIndex.value = index;
              },
              itemBuilder: (context, index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.25),
                    SvgPicture.asset(AppImages.deliveryBoy),
                    SizedBox(height: height * 0.07),
                    Text('Landing heading ${index + 1}',
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.headingColor,
                    ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit ut aliquam',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                    ),
                  ],
                );
              },
            ),
          ),
          Obx(() => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 5.0,
                width: 8.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: landingController.currentIndex.value == 0
                      ? AppColors.greenLightColor
                      : AppColors.greyIconColor,
                ),
              ),
              SizedBox(width: 8.0),
              Container(
                height: 5.0,
                width: 8.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: landingController.currentIndex.value == 1
                      ? AppColors.greenLightColor
                      : AppColors.greyIconColor,
                ),
              ),
              SizedBox(width: 8.0),
              Container(
                height: 5.0,
                width: 8.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: landingController.currentIndex.value == 2
                      ? AppColors.greenLightColor
                      : AppColors.greyIconColor,
                ),
              ),
            ],
          ),),
          const SizedBox(height: 32.0),
          CustomButton(
            onTap: (){
              Get.to(SignInScreen());
            },
            btnText: 'Sign in',
            margin: 16.0,
          ),
          SizedBox(height: height * 0.12),
        ],
      ),
    );
  }

}