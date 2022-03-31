import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../widgets/utils.dart';
import 'components/notify_box.dart';
import 'controller/notify_controller.dart';

class NotificationScreen extends GetView<NotifyController> {
  NotificationScreen({Key? key}) : super(key: key);

  final NotifyController notifyController = Get.put(NotifyController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: const Text('Notifications',
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
        actions: [
         /* IconButton(
            onPressed: (){},
            icon: const Icon(Icons.more_vert_outlined,
            color: AppColors.textThreeColor,
            ),
          ),*/
          PopupMenuButton(
            icon: const Icon(Icons.more_vert_outlined, color: AppColors.blackColor),
              color: AppColors.popupColor,
              offset: const Offset(-36.0, 16.0),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(AppImages.trashIcon, color: AppColors.blackColor),
                      const SizedBox(width: 5.0),
                      const Text('Dismiss all',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textThreeColor,
                      ),
                      ),
                    ],
                  ),
                  value: 1,
                ),
              ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            NotifyBoxWidget(
              titleText: 'A message from owner',
              timeText: '58 mins ago',
              notificationColor: AppColors.yellowNewColor,
            ),
            SizedBox(height: 8.0),
            NotifyBoxWidget(
              titleText: 'New job posted',
              timeText: '2 hours ago',
              notificationColor: AppColors.greyIconColor,
              isShadow: false,
            ),
            SizedBox(height: 8.0),
            NotifyBoxWidget(
              titleText: 'New job posted',
              timeText: '2 hours ago',
              notificationColor: AppColors.greyIconColor,
              isShadow: false,
            ),
          ],
        ),
      ),
    );
  }

}