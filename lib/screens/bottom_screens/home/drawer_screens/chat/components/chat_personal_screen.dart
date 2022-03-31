import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../res/app_colors.dart';
import '../../../../../../res/app_images.dart';
import '../../../../../../widgets/custom_icon_button.dart';
import '../controller/chat_controller.dart';
import 'receiver_box.dart';
import 'sender_box.dart';

class ChatPersonalScreen extends StatelessWidget {
  ChatPersonalScreen({Key? key}) : super(key: key);

  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        centerTitle: true,
        title: const Text('Sam Ji',
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
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const ReceiverBox(
                    isName: true,
                  ),
                  const SenderBox(),
                  const ReceiverBox(),
                  const SenderBox(
                    msgText: 'Job id #1646411',
                  ),
                  ReceiverBox(
                    isImage: true,
                    image: SizedBox(
                      height: 150.0,
                      width: width * 0.75,
                      child: Image.asset(AppImages.personImage,
                      fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 65.0,
            margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 36.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.greySColor.withOpacity(0.05),
                  blurRadius: 12.0,
                  spreadRadius: 1.0,
                  offset: const Offset(0.0, 4.0),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomIconButton(
                  onTap: (){},
                  height: 36.0,
                  width: 36.0,
                  margin: const EdgeInsets.only(left: 16.0),
                  btnColor: AppColors.greyIconColor,
                  icon: const Icon(Icons.add, color: Colors.white),
                ),
                Expanded(
                  child: TextFormField(
                    controller: chatController.enterTextController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: AppColors.textTwoColor,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type a message here',
                      hintStyle: TextStyle(
                        fontSize: 14.0,
                        color: AppColors.textTwoColor,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                CustomIconButton(
                  onTap: (){},
                  height: 40.0,
                  width: 40.0,
                  icon: SvgPicture.asset(AppImages.sendIcon),
                  margin: const EdgeInsets.only(right: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
