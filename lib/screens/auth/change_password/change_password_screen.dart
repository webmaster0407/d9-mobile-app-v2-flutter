import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../res/app_colors.dart';
import '../../../res/app_images.dart';
import '../../../widgets/custom_button.dart';
import '../../bottom_bar.dart';
import '../controller/auth_controller.dart';

class ChangePasswordScreen extends GetView<AuthController> {
  ChangePasswordScreen({Key? key}) : super(key: key);

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
        title: const Text('Change Password',
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
            changePasswordText(),
            const SizedBox(height: 18.0),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                        text: 'Please set your new password',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 12.0,
                        )
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            newPasswordText(),
            newPasswordField(),
            const SizedBox(height: 8.0),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text('Enter a valid password',
                style: TextStyle(
                  fontSize: 12.0,
                  color: AppColors.warningColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Manrope',
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            reEnterPasswordText(),
            reEnterPasswordField(),
            const SizedBox(height: 8.0),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text('Password did not match',
                style: TextStyle(
                  fontSize: 12.0,
                  color: AppColors.warningColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Manrope',
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: TextButton(
                  onPressed: (){},
                  child: const Text('Back to Login',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: AppColors.greyColor,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                  ),
                  ),
              ),
            ),
            const SizedBox(height: 20.0),
            CustomButton(
              onTap: (){
                Get.dialog(
                  successDialog(width),
                );
              },
              margin: 16.0,
              btnText: 'Confirm',
            ),
          ],
        ),
      ),
    );
  }

  Widget changePasswordText() => const Center(
    child: Text('Change Password',
      style: TextStyle(
        fontSize: 24.0,
        color: AppColors.textThreeColor,
        fontWeight: FontWeight.w800,
        fontFamily: 'Manrope',
      ),
    ),
  );

  Widget newPasswordText() => const Padding(
    padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
    child: Text('New password',
      style: TextStyle(
        fontSize: 16.0,
        color: AppColors.textThreeColor,
        fontWeight: FontWeight.w700,
        fontFamily: 'Manrope',
      ),
    ),
  );

  Widget newPasswordField() => Container(
    height: 48.0,
    margin: const EdgeInsets.symmetric(horizontal: 16.0),
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
      controller: authController.newPasswordController,
      keyboardType: TextInputType.text,
      obscureText: true,
      obscuringCharacter: '*',
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: '**********',
        hintStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          fontFamily: 'Manrope',
          color: AppColors.greyIconColor,
        ),
        contentPadding: EdgeInsets.only(bottom: 11.0),
      ),
    ),
  );

  Widget reEnterPasswordText() => const Padding(
    padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
    child: Text('Re-enter password',
      style: TextStyle(
        fontSize: 16.0,
        color: AppColors.textThreeColor,
        fontWeight: FontWeight.w700,
        fontFamily: 'Manrope',
      ),
    ),
  );

  Widget reEnterPasswordField() => Container(
    height: 48.0,
    margin: const EdgeInsets.symmetric(horizontal: 16.0),
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
      controller: authController.reEnterPasswordController,
      keyboardType: TextInputType.text,
      obscureText: true,
      obscuringCharacter: '*',
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: '**********',
        hintStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          fontFamily: 'Manrope',
          color: AppColors.greyIconColor,
        ),
        contentPadding: EdgeInsets.only(bottom: 11.0),
      ),
    ),
  );

  Widget successDialog(width) => Center(
    child: Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 32.0, top: 12.0),
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 64.0,
              width: 64.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.mainColor,
              ),
              child: const Center(
                child: Icon(Icons.check, color: Colors.white, size: 48.0),
              ),
            ),
            const SizedBox(height: 32.0),
            const Text('Great, password '
                '\nhas been updated!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Manrope',
                color: AppColors.greyDarkColor,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Your password has been updated. Please '
                '\nlogin to your account using your new '
                '\npassword',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Manrope',
                color: AppColors.greyColor,
              ),
            ),
            const SizedBox(height: 16.0),
            CustomButton(
              onTap: (){
                Get.dialog(
                  failDialog(width),
                );
              },
              btnText: 'Okay!',
              width: width * 0.24,
              fontSize: 12.0,
              height: 36.0,
            ),
          ],
        ),
      ),
    ),
  );

  Widget failDialog(width) => Center(
    child: Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 32.0, top: 12.0),
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 64.0,
              width: 64.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.brownDarkColor,
              ),
              child: Center(
                child: SvgPicture.asset(AppImages.warningIcon),
              ),
            ),
            const SizedBox(height: 32.0),
            const Text('Failed to update '
                '\npassword!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Manrope',
                color: AppColors.greyDarkColor,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Mauris etiam ut amet nibh pursfus '
                '\nrisus. Mattis magnis sem quis at '
                '\nfaibus dam ipsum donec varius?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Manrope',
                color: AppColors.greyColor,
              ),
            ),
            const SizedBox(height: 16.0),
            CustomButton(
              onTap: (){
                //Get.to(HomeScreen());
                Get.to(BottomBar());
              },
              btnText: 'Try again',
              width: width * 0.28,
              fontSize: 12.0,
              height: 36.0,
              btnColor: AppColors.brownDarkColor,
            ),
          ],
        ),
      ),
    ),
  );
}