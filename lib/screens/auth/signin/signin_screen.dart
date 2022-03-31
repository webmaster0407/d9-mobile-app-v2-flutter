import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../res/app_colors.dart';
import '../../../res/app_images.dart';
import '../../../widgets/custom_button.dart';
import '../../help/help_screen.dart';
import '../controller/auth_controller.dart';
import '../recovery/recovery_screen.dart';

class SignInScreen extends GetView<AuthController> {
  SignInScreen({Key? key}) : super(key: key);

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
        title: const Text('Sign in',
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
            welcomeText(),
            const SizedBox(height: 18.0),
            welcomeDesc(),
            const SizedBox(height: 36.0),
            phoneText(),
            phoneField(),
            const SizedBox(height: 8.0),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text('Please enter correct number',
                style: TextStyle(
                  fontSize: 12.0,
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Manrope',
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            passwordText(),
            passwordField(),
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
            const SizedBox(height: 8.0),
            forgotPassButton(),
            const SizedBox(height: 24.0),
            CustomButton(
              onTap: (){
                Get.to(RecoveryScreen());
              },
              margin: 16.0,
              btnText: 'Sign in',
            ),
            SizedBox(height: height * 0.06),
            needHelpButton(),
            const SizedBox(height: 24.0),
            agreeTermPrivacyText(),
          ],
        ),
      ),
    );
  }

  Widget welcomeText() => const Center(
    child: Text('Welcome!',
      style: TextStyle(
        fontSize: 24.0,
        color: AppColors.textThreeColor,
        fontWeight: FontWeight.w800,
        fontFamily: 'Manrope',
      ),
    ),
  );

  Widget welcomeDesc() => Center(
    child: RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        children: [
          TextSpan(
              text: 'Login',
              style: TextStyle(
                fontFamily: 'Manrope',
                color: AppColors.greyColor,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              )
          ),
          TextSpan(
              text: ' with your phone number and password',
              style: TextStyle(
                fontFamily: 'Manrope',
                color: AppColors.greyColor,
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              )
          ),
        ],
      ),
    ),
  );

  Widget phoneText() => const Padding(
    padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
    child: Text('Phone',
      style: TextStyle(
        fontSize: 16.0,
        color: AppColors.textThreeColor,
        fontWeight: FontWeight.w700,
        fontFamily: 'Manrope',
      ),
    ),
  );

  Widget phoneField() => Padding(
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
              controller: authController.signinNumberController,
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

  Widget passwordText() => const Padding(
    padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
    child: Text('Password',
      style: TextStyle(
        fontSize: 16.0,
        color: AppColors.textThreeColor,
        fontWeight: FontWeight.w700,
        fontFamily: 'Manrope',
      ),
    ),
  );

  Widget passwordField() => Container(
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
      controller: authController.signinPassController,
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

  Widget forgotPassButton() => Align(
    alignment: Alignment.centerRight,
    child: Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: TextButton(
        onPressed: (){},
        child: const Text('Forgot password?',
          style: TextStyle(
            fontSize: 14.0,
            color: AppColors.greyDarkColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ),
  );

  Widget needHelpButton() => Center(
    child: TextButton(
      onPressed: (){
        Get.to(HelpScreen());
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Need help?',
            style: TextStyle(
              fontSize: 14.0,
              color: AppColors.textTwoColor,
              fontWeight: FontWeight.w700,
              fontFamily: 'Manrope',
            ),
          ),
          SizedBox(width: 4.0),
          SvgPicture.asset(AppImages.supportIcon),
        ],
      ),
    ),
  );

  Widget agreeTermPrivacyText() => Center(
    child: RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        children: [
          TextSpan(
              text: 'By signing up, you are agreeing to these\n ',
              style: TextStyle(
                fontSize: 12.0,
                color: AppColors.greyColor,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              )
          ),
          TextSpan(
              text: 'Terms of Service ',
              style: TextStyle(
                fontSize: 12.0,
                color: AppColors.mainColor,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              )
          ),
          TextSpan(
              text: 'and ',
              style: TextStyle(
                fontSize: 12.0,
                color: AppColors.greyColor,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              )
          ),
          TextSpan(
              text: 'Privacy Policy.',
              style: TextStyle(
                fontSize: 12.0,
                color: AppColors.mainColor,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              )
          ),
        ],
      ),
    ),
  );
}