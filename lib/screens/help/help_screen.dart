import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/utils.dart';
import 'components/help_box_widget.dart';
import 'controller/help_controller.dart';

class HelpScreen extends GetView<HelpController> {
  HelpScreen({Key? key}) : super(key: key);

  final HelpController helpController = Get.put(HelpController());

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
        title: const Text('Help',
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
          const SizedBox(height: 16.0),
          const HelpBoxWidget(
            iconPath: AppImages.teamWorkIcon,
            titleText: 'What  if I switch organization?',
          ),
          const HelpBoxWidget(
            iconPath: AppImages.blockUserIcon,
            titleText: 'Can I block someone in chat?',
          ),
          const HelpBoxWidget(
            iconPath: AppImages.padlockIcon,
            titleText: 'How can I change password?',
          ),
          Spacer(),
          CustomButton(
            onTap: (){},
            margin: 16.0,
            btnColor: Colors.white,
            borderColor: AppColors.greyLightLColor,
            btnText: 'Ask a question',
            fontColor: AppColors.blackColor,
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }

}
