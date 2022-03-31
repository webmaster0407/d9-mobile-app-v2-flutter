import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../widgets/utils.dart';
import 'components/detail_note_sheet.dart';
import 'components/details_sheet.dart';
import 'components/failure_note_sheet.dart';
import 'controller/order_start_controller.dart';

class OrderStartScreen extends StatelessWidget {
  OrderStartScreen({Key? key}) : super(key: key);

  final OrderStartController orderStartController = Get.put(OrderStartController());

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
        title: const Text('Job ID: FDGFSDSH',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 24.0),
            mapBox(height, width),
            const SizedBox(height: 16.0),
            jobHistoryRow(width),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: SvgPicture.asset(
                            orderStartController.isDestination.value == true ? AppImages.activeDestinationStep : AppImages.destinationStep,
                          ),
                          onTap: orderStartController.isDestFun,
                        ),
                        SizedBox(
                          height: height * 0.175,
                          child: const VerticalDivider(
                            color: AppColors.textThreeColor,
                            thickness: 1.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: orderStartController.isProofDeliveryFun,
                          child: SvgPicture.asset(
                            orderStartController.isProofDelivery.value == true ? AppImages.activeProofDeliveryStep : AppImages.inactiveProofDeliveryStep,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.175,
                          child: const VerticalDivider(
                            color: AppColors.textThreeColor,
                            thickness: 1.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: orderStartController.isDeliveryConfirmFun,
                          child: SvgPicture.asset(
                            orderStartController.isDeliverConfirm.value == true ? AppImages.confirmDeliveryStep : AppImages.inactiveConfirmDeliveryStep,
                          ),
                        ),
                      ],
                    ),),
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
                          child: Obx(() => Column(
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
                              const SizedBox(height: 24.0),
                              Row(
                                children: [
                                  orderStartController.isComplete.value == true
                                      ? Expanded(
                                    child: CustomButton(
                                      onTap: (){
                                        Get.bottomSheet(
                                          FailureNoteSheet(),
                                          isScrollControlled: true,
                                        );
                                      },
                                      height: 40.0,
                                      btnColor: AppColors.mainColor,
                                      borderColor: AppColors.mainColor,
                                      btnText: 'Complete',
                                      fontSize: 16.0,
                                      fontColor: Colors.white,
                                    ),
                                  )
                                      : Expanded(
                                    child: CustomButton(
                                      onTap: (){},
                                      height: 40.0,
                                      btnColor: Colors.white,
                                      borderColor: AppColors.greyLightLColor,
                                      btnText: 'Complete',
                                      fontSize: 16.0,
                                      fontColor: AppColors.textThreeColor,
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  orderStartController.isComplete.value == true
                                      ? Expanded(
                                    child: CustomButton(
                                      onTap: (){},
                                      height: 40.0,
                                      btnColor: Colors.white,
                                      borderColor: AppColors.greyLightLColor,
                                      btnText: 'Failed',
                                      fontSize: 16.0,
                                      fontColor: AppColors.textThreeColor,
                                    ),
                                  )
                                      : Expanded(
                                    child: CustomButton(
                                      onTap: (){},
                                      height: 40.0,
                                      btnColor: AppColors.redColor,
                                      borderColor: AppColors.redColor,
                                      btnText: 'Failed',
                                      fontSize: 16.0,
                                      fontColor: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),),
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
      child: Stack(
        children: [
          const GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(40.587968, 60.814708),
              zoom: 2,
            ),
          ),
          Positioned(
            bottom: 100.0,
            right: 0.0,
            child: Container(
              height: 45.0,
              width: 45.0,
              margin: const EdgeInsets.only(right: 10.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: SvgPicture.asset(AppImages.trackIcon),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 36.0,
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.warningSkyColor,
                border: Border.all(
                  color: Colors.white,
                  width: 3.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greyColor.withOpacity(0.6),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Center(
                child: SvgPicture.asset(AppImages.sendIcon),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget jobHistoryRow(width) => Padding(
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
          onPressed: (){
            Get.bottomSheet(
              DetailsSheet(),
              isScrollControlled: true,
            );
          },
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
            TextButton(
              onPressed: (){
                Get.bottomSheet(
                  DetailNoteSheet(),
                  isScrollControlled: true,
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('Delivery note',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: AppColors.greyDarkColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Manrope',
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_outlined, size: 12.0, color: Colors.black),
                ],
              ),
            ),
          ],
        ),
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
                    btnColor: AppColors.notStartColor,
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
