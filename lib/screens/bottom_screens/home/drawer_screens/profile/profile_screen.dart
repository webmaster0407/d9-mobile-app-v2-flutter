import 'package:delivery_app/res/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:get/get.dart';

import '../../../../../res/app_colors.dart';
import '../../../../../widgets/custom_button.dart';
import 'controller/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  ProfileScreen({Key? key}) : super(key: key);

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        centerTitle: true,
        title: const Text('Profile',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            color: AppColors.textThreeColor,
            fontFamily: 'Manrope',
          ),
        ),
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black, size: 20.0),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 24.0),
          Bounceable(
            onTap: (){},
            child: Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 60.0,
                    backgroundImage: AssetImage(AppImages.personImage),
                  ),
                  Positioned(
                    bottom: 8.0,
                    right: 0.0,
                    child: Container(
                      height: 24.0,
                      width: 24.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.mainColor,
                      ),
                      child: const Center(
                        child: const Icon(Icons.add, color: Colors.white, size: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          const Center(
            child: Text('Saarah beth',
            style: TextStyle(
              fontSize: 24.0,
              fontFamily: 'Manrope',
              color: AppColors.textThreeColor,
              fontWeight: FontWeight.w700,
            ),
            ),
          ),
          const SizedBox(height: 8.0),
          Center(
            child: SmoothStarRating(
                allowHalfRating: false,
                onRatingChanged: (v) {
                  profileController.rating = v;
                },
                starCount: 5,
                rating: profileController.rating,
                size: 40.0,
                /*filledIconData: Icons.blur_off,
                halfFilledIconData: Icons.blur_on,*/
                color: AppColors.yellowColor,
                borderColor: AppColors.yellowColor,
                spacing:0.0
            ),
          ),
          const SizedBox(height: 50.0),
          detailBox('First name', 'Sarrah'),
          detailBox('Last name', 'Beth'),
          detailBox('Email', 'isayef@gmail.com'),
          detailBox('Phone number', '654646 64654684'),
          const Spacer(),
          CustomButton(
            onTap: (){},
            margin: 16.0,
            btnColor: Colors.white,
            borderColor: AppColors.greyLightLColor,
            btnText: 'Sign out',
            fontColor: AppColors.blackColor,
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget detailBox(titleText, descText) => Container(
    height: 50.0,
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(titleText,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            color: AppColors.shadowColor,
            fontFamily: 'Manrope',
          ),
        ),
        Text(descText,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: AppColors.greyColor,
            fontFamily: 'Manrope',
          ),
        ),
      ],
    ),
  );

}