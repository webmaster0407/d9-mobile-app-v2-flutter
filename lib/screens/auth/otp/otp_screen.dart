import 'package:delivery_app/screens/auth/change_password/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../res/app_colors.dart';
import '../../../widgets/custom_button.dart';
import '../controller/auth_controller.dart';

class OTPScreen extends GetView<AuthController> {
  OTPScreen({Key? key}) : super(key: key);

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
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
       title: const Text('OTP',
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
           verifyPhoneText(),
           const SizedBox(height: 18.0),
           Center(
             child: RichText(
               textAlign: TextAlign.center,
               text: const TextSpan(
                 children: [
                   TextSpan(
                       text: 'Enter the 6-Digit code sent to you\n',
                       style: TextStyle(
                         fontFamily: 'Manrope',
                         color: AppColors.greyColor,
                         fontWeight: FontWeight.w300,
                         fontSize: 12.0,
                       )
                   ),
                   TextSpan(
                       text: 'at +1501333982',
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
           const SizedBox(height: 64.0),
           Center(
             child: Pinput(
               length: 6,
               pinAnimationType: PinAnimationType.none,
               defaultPinTheme: defaultPinTheme,
               focusedPinTheme: defaultPinTheme,
               followingPinTheme: defaultPinTheme,
             ),
           ),
           const SizedBox(height: 8.0),
           const Padding(
             padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
             child: Text('Successfully verified',
               style: TextStyle(
                 fontSize: 12.0,
                 color: AppColors.warningOneColor,
                 fontWeight: FontWeight.w500,
                 fontFamily: 'Manrope',
               ),
             ),
           ),
           const SizedBox(height: 48.0),
           CustomButton(
             onTap: (){
               Get.to(ChangePasswordScreen());
             },
             margin: 16.0,
             btnText: 'Confirm',
           ),
           const SizedBox(height: 32.0),
           Center(
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisSize: MainAxisSize.min,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 const Text('Didn’t get the code?',
                 style: TextStyle(
                   color: AppColors.textTwoColor,
                   fontSize: 14.0,
                   fontWeight: FontWeight.w500,
                   fontFamily: 'Manrope',
                 ),
                 ),
                 TextButton(
                   onPressed: (){},
                   child: Text('Send again',
                   style: TextStyle(
                     fontSize: 14.0,
                     color: AppColors.mainColor,
                     fontWeight: FontWeight.w500,
                     fontFamily: 'Manrope',
                   ),
                   ),
                 ),
               ],
             ),
           ),
         ],
       ),
     ),
   );
  }

  final defaultPinTheme = PinTheme(
    width: 48,
    height: 48,
    textStyle: const TextStyle(
        fontSize: 24,
        color: AppColors.textThreeColor,
        fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      color: AppColors.pinBoxColor,
      borderRadius: BorderRadius.circular(6.0),
    ),
  );

  Widget verifyPhoneText() => const Center(
    child: Text('Verify phone number',
      style: TextStyle(
        fontSize: 24.0,
        color: AppColors.textThreeColor,
        fontWeight: FontWeight.w800,
        fontFamily: 'Manrope',
      ),
    ),
  );

}