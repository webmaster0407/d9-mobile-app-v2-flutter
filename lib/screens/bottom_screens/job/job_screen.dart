import 'package:delivery_app/screens/bottom_screens/job/components/filter_search_item.dart';
import 'package:delivery_app/screens/bottom_screens/job/map_view/map_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../res/app_colors.dart';
import '../../../res/app_images.dart';
import '../home/components/expand_widget.dart';
import '../home/controller/home_controller.dart';
import '../home/drawer_screens/chat/chat_list_screen.dart';
import '../home/drawer_screens/profile/profile_screen.dart';
import '../home/drawer_screens/shift/shift_screen.dart';
import 'components/job_box.dart';
import 'controller/job_controller.dart';

class JobScreen extends GetView<JobController> {
  JobScreen({Key? key}) : super(key: key);

  final JobController jobController = Get.put(JobController());
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: homeController.scaffoldKey,
      backgroundColor: Colors.white,
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
          'Jobs',
          style: TextStyle(
            fontSize: 18.0,
            color: AppColors.textThreeColor,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){
                Get.to(const MapViewScreen());
              },
              icon: SvgPicture.asset(AppImages.routeIcon),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.mainOneColor,
        child: drawerData(width),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            todayAllJobWidget(width),
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 50.0,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: AppColors.pinBoxColor,
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 16.0),
                          hintText: 'Same here....',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Material(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(4.0),
                    child: InkWell(
                      onTap: (){
                        Get.bottomSheet(
                          bootomSheetData(),
                          elevation: 5.0,
                          enableDrag: true,
                        );
                      },
                      child: SizedBox(
                        height: 50.0,
                        width: 50.0,
                        child: Center(
                          child: SvgPicture.asset(AppImages.filterIcon),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const JobBox(
              iconPath: AppImages.uploadYellowIcon,
              timeText: 'Due in 30 mins',
            ),
            const JobBox(
              iconPath: AppImages.upwardIcon,
              timeText: 'Late by 30 mins',
            ),
            const JobBox(
              iconPath: AppImages.uploadMainIcon,
              timeText: 'Due in 1 hour',
            ),
            const JobBox(
              iconPath: AppImages.downgradeIcon,
              timeText: 'Due in 1 hour',
            ),
            const JobBox(
              iconPath: AppImages.uploadGreenIcon,
              timeText: 'ETA 20 mins',
            ),
          ],
        ),
      ),
    );
  }

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
            const ExpandWidget(),
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
      const Spacer(),
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
              const Text('Sign out',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 80.0),
    ],
  );

  Widget todayAllJobWidget(width) => Center(
    child: Container(
      height: 40.0,
      width: width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(
          color: AppColors.mainColor,
          width: 1.0,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: AppColors.mainColor,
              ),
              child: const Center(
                child: Text('Today',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Manrope',
                  ),
                ),
              ),
            ),
          ),
          Expanded(child: Container(
            child: const Center(
              child: Text('All jobs',
                style: TextStyle(
                  fontSize: 14.0,
                  color: AppColors.textThreeColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Manrope',
                ),
              ),
            ),
          )),
        ],
      ),
    ),
  );


  Widget bootomSheetData() => Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8.0),
        Center(
          child: Container(
            height: 3.0,
            width: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: AppColors.greyIconColor,
            ),
          ),
        ),
        const SizedBox(height: 30.0),
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: const Text('Filter search',
            style: TextStyle(
              fontSize: 20.0,
              color: AppColors.textThreeColor,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 28.0),
        FilterSearchItem(
          onTap: (){},
          iconPath: AppImages.uploadMainIcon,
          itemText: 'Pickup',
        ),
        FilterSearchItem(
          onTap: (){},
          iconPath: AppImages.downgradeIcon,
          itemText: 'Dropoff',
        ),
        FilterSearchItem(
          onTap: (){},
          iconPath: AppImages.upwardIcon,
          itemText: 'Delayed',
        ),
        FilterSearchItem(
          onTap: (){},
          iconPath: AppImages.uploadYellowIcon,
          itemText: 'Due Soon',
        ),
        FilterSearchItem(
          onTap: (){},
          iconPath: AppImages.uploadGreenIcon,
          itemText: 'In Progress',
        ),
        const SizedBox(height: 36.0),
      ],
    ),
  );

}