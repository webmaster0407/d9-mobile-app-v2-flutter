import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../widgets/utils.dart';
import '../../notification/notification_screen.dart';
import 'components/expand_widget.dart';
import 'components/job_widget.dart';
import 'controller/home_controller.dart';
import 'drawer_screens/chat/chat_list_screen.dart';
import 'drawer_screens/profile/profile_screen.dart';
import 'drawer_screens/shift/shift_screen.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: homeController.scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(
          onPressed: () {
            homeController.scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(Icons.menu, color: AppColors.blackColor),
        ),
        centerTitle: true,
        title: const Text(
          'Offline',
          style: TextStyle(
            fontSize: 18.0,
            color: AppColors.textThreeColor,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Obx(
            () => homeController.online.value
                ? InkWell(
                onTap: (){
                  Get.to(NotificationScreen());
                },
                child: Image.asset(AppImages.notificationIcon),
            )
                : const SizedBox(),
          ),
          Obx(() => FlutterSwitch(
                height: 26.0,
                width: 48.0,
                inactiveColor: AppColors.greyToggleColor.withOpacity(0.2),
                inactiveToggleColor: Colors.white,
                activeColor: AppColors.greenDarkColor,
                padding: 1.2,
                value: homeController.online.value,
                //onToggle: (val) => homeController.onlineToggle(),
                onToggle: (val){
                  homeController.online.value = homeController.online.value ? false : true;

                  homeController.online.value == true
                      ? Get.defaultDialog(
                    title: 'Go online!',
                    titlePadding: const EdgeInsets.only(top: 24.0),
                    titleStyle: const TextStyle(
                      fontSize: 24.0,
                      color: AppColors.blackColor,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('By switching your status to online, you will be sharing your location '
                            'with your organization. Do you agree?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyColor,
                          fontFamily: 'Manrope',
                        ),
                        ),
                        const SizedBox(height: 32.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              onTap: (){
                                Get.back();
                                homeController.online.value = false;
                              },
                              btnText: 'Later',
                              height: 32.0,
                              width: 75.0,
                              btnColor: AppColors.btnColor,
                              radius: 4.0,
                              fontSize: 12.0,
                              fontColor: AppColors.mainColor,
                            ),
                            const SizedBox(width: 24.0),
                            CustomButton(
                              onTap: (){
                                Get.back();
                              },
                              btnText: 'Sure',
                              height: 32.0,
                              width: 75.0,
                              btnColor: AppColors.mainColor,
                              radius: 4.0,
                              fontSize: 12.0,
                            ),
                          ],
                        ),
                      ],
                    ),

                  )
                      : const SizedBox();
                },
              )),
          const SizedBox(width: 8.0),
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.mainOneColor,
        child: drawerData(width),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            SizedBox(
              height: height,
              width: width,
              child: const GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(40.587968, 60.814708),
                  zoom: 8,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => homeController.online.value
                      ? const SizedBox()
                      : Container(
                          height: 65.0,
                          width: width,
                          decoration: const BoxDecoration(
                            color: AppColors.mainColor,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppImages.cloudIcon),
                              const SizedBox(width: 8.0),
                              const Text(
                                'You  are offline. Go online to start jobs!',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
                Obx(
                  () => homeController.online.value
                      ? const SizedBox(height: 135.0)
                      : const SizedBox(height: 70.0),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Container(
                      height: 160.0,
                      width: 160.0,
                      margin: const EdgeInsets.only(left: 34.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.mainColor.withOpacity(0.2),
                      ),
                      child: Center(
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.warningOneColor,
                            border: Border.all(
                              width: 2.0,
                              color: Colors.white,
                            ),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              AppImages.moveIcon,
                              height: 20.0,
                              width: 20.0,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 45.0,
                      width: 45.0,
                      margin: const EdgeInsets.only(right: 16.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: SvgPicture.asset(AppImages.trackIcon),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                Container(
                  width: width,
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      namePicRow(),
                      const SizedBox(height: 16.0),
                      onlineHourWidget(),
                      const SizedBox(height: 16.0),
                      jobsRow(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget namePicRow() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 28.0,
            backgroundImage: AssetImage(AppImages.personImage),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sarrah Beth',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: AppColors.greyDarkColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Manrope',
                  ),
                ),
                const SizedBox(height: 4.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pixel Navy. LTD',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.arrow_back_ios_outlined,
                            size: 10.0, color: Colors.black),
                        SizedBox(width: 5.0),
                        Text(
                          'Today',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: AppColors.greyDarkColor,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Icon(Icons.arrow_forward_ios,
                            size: 10.0, color: Colors.black),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

  Widget onlineHourWidget() => Center(
        child: SizedBox(
          height: 70.0,
          width: 140.0,
          child: Stack(
            children: [
              Image.asset(AppImages.ellipseOneImage),
              Image.asset(AppImages.ellipseTwoImage),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(height: 24.0),
                    Text(
                      '30',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Total online hours',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget jobsRow() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            JobWidget(
              iconPath: AppImages.pendingJobIcon,
              jobText: '102',
              jobDescText: 'Pending jobs',
            ),
            JobWidget(
              iconPath: AppImages.totalJobIcon,
              jobText: '200',
              jobDescText: 'Total jobs',
            ),
            JobWidget(
              iconPath: AppImages.cancelJobIcon,
              jobText: '102',
              jobDescText: 'Failed jobs',
            ),
          ],
        ),
      );

  Widget drawerData(width) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        width: width,
        color: AppColors.mainColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 80.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: (){
                    Get.back();
                  },
                  icon: const Icon(Icons.close, color: Colors.white),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: CircleAvatar(
                radius: 28.0,
                backgroundImage: AssetImage(AppImages.personImage),
              ),
            ),
            const SizedBox(height: 4.0),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text('Organization',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Manrope',
                ),
              ),
            ),
            const SizedBox(height: 2.0),
            ExpandWidget(),
          ],
        ),
      ),
      ListTile(
        onTap: (){
          Get.back();
          Get.to(ShiftScreen());
        },
        leading: SvgPicture.asset(AppImages.shiftIcon),
        title: const Text('Shifts',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      ListTile(
        onTap: (){
          Get.back();
          Get.to(ChatListScreen());
        },
        leading: SvgPicture.asset(AppImages.chatIcon),
        title: const Text('Chat',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      ListTile(
        onTap: (){
          Get.back();
          Get.to(ProfileScreen());
        },
        leading: SvgPicture.asset(AppImages.profileIcon),
        title: const Text('Profile',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      Spacer(),
      Center(
        child: TextButton(
          onPressed: (){},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppImages.logoutIcon),
              const SizedBox(width: 12.0),
              GestureDetector(
                onTap: () {
                  print('singout');
                },
                child: const Text('Sign out',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: 80.0),
    ],
  );
}
