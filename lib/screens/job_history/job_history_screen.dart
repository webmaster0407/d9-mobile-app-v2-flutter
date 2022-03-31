import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widgets/utils.dart';
import 'controller/job_history_controller.dart';

class JobHistoryScreen extends GetView<JobHistoryController> {
  JobHistoryScreen({Key? key}) : super(key: key);

  final JobHistoryController jobHistoryController = Get.put(JobHistoryController());

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
        title: const Text(
          'Job ID: FDGFSDSH',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            color: AppColors.textThreeColor,
            fontFamily: 'Manrope',
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
            //Get.to(BottomBar());
          },
          icon: const Icon(Icons.arrow_back_ios_outlined,
              color: Colors.black, size: 20.0),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 24.0),
            mapBox(height, width),
            const SizedBox(height: 16.0),
            jobHistoryRow(),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppImages.destinationStep),
                        SizedBox(
                          height: height * 0.18,
                          child: const VerticalDivider(
                            color: AppColors.textThreeColor,
                            thickness: 1.0,
                          ),
                        ),
                        SvgPicture.asset(AppImages.proofDeliveryStep),
                        SizedBox(
                          height: height * 0.18,
                          child: const VerticalDivider(
                            color: AppColors.textThreeColor,
                            thickness: 1.0,
                          ),
                        ),
                        SvgPicture.asset(AppImages.confirmDeliveryStep),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        destinationStep(height, width),
                        proofDeliveryStep(height, width),
                        SizedBox(
                          width: width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text('Delivery confirmation',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Manrope',
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text('Completed',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: AppColors.greyColor,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Manrope',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 24.0),
                              const Padding(
                                padding: EdgeInsets.only(top: 16.0),
                                child: Text('27 Jan, 12:30 pm',
                                  style: TextStyle(
                                    fontSize: 10.0,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget mapBox(height, width) => Container(
    height: height * 0.35,
    width: width,
    margin: const EdgeInsets.symmetric(horizontal: 16.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: const GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(40.587968, 60.814708),
          zoom: 2,
        ),
      ),
    ),
  );

  Widget jobHistoryRow() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Job History',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w700,
            color: AppColors.textThreeColor,
          ),
        ),
        TextButton(
          onPressed: (){},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text('Details',
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w700,
                  color: AppColors.textThreeColor,
                ),
              ),
              Icon(Icons.arrow_forward_ios_outlined, size: 12.0, color: AppColors.textThreeColor),
            ],
          ),
        ),
      ],
    ),
  );

  Widget destinationStep(height, width) => SizedBox(
    height: height * 0.25,
    width: width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text('Destination',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Manrope',
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text('971 S Pioneer Rd,Town	Beulah, Michigan',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Manrope',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24.0),
            const Text('27 Jan, 12:30 pm',
              style: TextStyle(
                fontSize: 10.0,
                color: AppColors.mainColor,
                fontWeight: FontWeight.w500,
                fontFamily: 'Manrope',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Container(
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 15.0),
          decoration: BoxDecoration(
            color: AppColors.stepBoxColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 20.0,
                backgroundImage: const AssetImage(AppImages.personImage),
              ),
              const SizedBox(width: 6.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('Contact',
                      style: TextStyle(
                        fontSize: 9.0,
                        color: AppColors.greyColor,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Text('Sayef Mahmud',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textThreeColor,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    onTap: (){},
                    height: 36.0,
                    width: 36.0,
                    btnColor: AppColors.notStartColor,
                    icon: SvgPicture.asset(AppImages.callIcon),
                  ),
                  const SizedBox(height: 2.0),
                  const Text('Call',
                    style: TextStyle(
                      fontSize: 10.0,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    onTap: (){},
                    height: 36.0,
                    width: 36.0,
                    btnColor: AppColors.notStartColor,
                    icon: SvgPicture.asset(AppImages.navIcon),
                  ),
                  const SizedBox(height: 2.0),
                  const Text('Nav',
                    style: TextStyle(
                      fontSize: 10.0,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24.0),
      ],
    ),
  );

  Widget proofDeliveryStep(height, width) =>  SizedBox(
    height: height * 0.25,
    width: width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text('Proof of Delivery',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Manrope',
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text('Submitted',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Manrope',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24.0),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text('Delivery note',
                style: TextStyle(
                  fontSize: 10.0,
                  color: AppColors.greyDarkColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Manrope',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(Icons.arrow_forward_ios_outlined, size: 12.0, color: Colors.black),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text('27 Jan, 12:30 pm',
              style: TextStyle(
                fontSize: 10.0,
                color: AppColors.mainColor,
                fontWeight: FontWeight.w500,
                fontFamily: 'Manrope',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Container(
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 15.0),
          decoration: BoxDecoration(
            color: AppColors.stepBoxColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    onTap: (){},
                    height: 36.0,
                    width: 36.0,
                    btnColor: AppColors.notStartColor,
                    icon: SvgPicture.asset(AppImages.callIcon),
                  ),
                  const SizedBox(height: 2.0),
                  const Text('Sign',
                    style: TextStyle(
                      fontSize: 10.0,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    onTap: (){},
                    height: 36.0,
                    width: 36.0,
                    btnColor: AppColors.notStartColor,
                    icon: SvgPicture.asset(AppImages.navIcon),
                  ),
                  const SizedBox(height: 2.0),
                  const Text('Photos',
                    style: TextStyle(
                      fontSize: 10.0,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    onTap: (){},
                    height: 36.0,
                    width: 36.0,
                    btnColor: AppColors.notStartColor,
                    icon: SvgPicture.asset(AppImages.navIcon),
                  ),
                  const SizedBox(height: 2.0),
                  const Text('Bar code',
                    style: TextStyle(
                      fontSize: 10.0,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    onTap: (){},
                    height: 36.0,
                    width: 36.0,
                    btnColor: AppColors.mainColor,
                    icon: SvgPicture.asset(AppImages.navIcon),
                  ),
                  const SizedBox(height: 2.0),
                  const Text('COD',
                    style: TextStyle(
                      fontSize: 10.0,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24.0),
      ],
    ),
  );

}