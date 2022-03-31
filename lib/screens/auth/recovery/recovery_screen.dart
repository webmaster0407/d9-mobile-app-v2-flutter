import 'package:delivery_app/screens/auth/otp/otp_screen.dart';
import 'package:delivery_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/app_colors.dart';
import '../controller/auth_controller.dart';

class RecoveryScreen extends GetView<AuthController> {
  RecoveryScreen({Key? key}) : super(key: key);

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_outlined,
              color: AppColors.textThreeColor,
              size: 16.0,
          ),
        ),
        title: const Text('Recovery',
          style: TextStyle(
            fontSize: 17.0,
            color: AppColors.textThreeColor,
            fontWeight: FontWeight.w800,
            fontFamily: 'Manrope',
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 36.0),
            forgotPassText(),
            const SizedBox(height: 18.0),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                        text: 'Please provide your  phone number\n',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        )
                    ),
                    TextSpan(
                        text: 'to reset password',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        )
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 36.0),
            labelText(),
            labelField(),
            const SizedBox(height: 8.0),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text('Supplementary information',
                style: TextStyle(
                  fontSize: 12.0,
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Manrope',
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            CustomButton(
              onTap: (){
                Get.to(OTPScreen());
              },
              margin: 16.0,
              btnText: 'Send OTP',
            ),
          ],
        ),
      ),
    );
  }

  Widget forgotPassText() => const Center(
    child: Text('Forgot password',
      style: TextStyle(
        fontSize: 24.0,
        color: AppColors.textThreeColor,
        fontWeight: FontWeight.w800,
        fontFamily: 'Manrope',
      ),
    ),
  );

  Widget labelText() => const Padding(
    padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
    child: Text('Label',
      style: TextStyle(
        fontSize: 16.0,
        color: AppColors.textThreeColor,
        fontWeight: FontWeight.w700,
        fontFamily: 'Manrope',
      ),
    ),
  );

  Widget labelField() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 48.0,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(
              color: AppColors.greyLightColor,
              width: 1.0,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(Icons.add, color: AppColors.textThreeColor, size: 16.0),
              Text('86',
                style: TextStyle(
                  fontSize: 16.0,
                  color: AppColors.textThreeColor,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 12.0),
              Icon(Icons.keyboard_arrow_down_outlined, color: AppColors.textThreeColor, size: 18.0),
            ],
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Container(
            height: 48.0,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                color: AppColors.greyLightColor,
                width: 1.0,
              ),
            ),
            child: TextFormField(
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Manrope',
                color: AppColors.textThreeColor,
              ),
              controller: authController.forgotPassNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Your phone number',
                hintStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Manrope',
                  color: AppColors.greyIconColor,
                ),
                contentPadding: EdgeInsets.only(bottom: 11.0),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}