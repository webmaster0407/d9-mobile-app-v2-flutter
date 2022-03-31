import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../widgets/utils.dart';
import '../order_start/order_start_screen.dart';

class JobDetailScreen extends StatelessWidget {
  const JobDetailScreen({Key? key}) : super(key: key);

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          mapBox(height, width),
          const SizedBox(height: 16.0),
          buttonsRow(width),
          const SizedBox(height: 16.0),
          Container(
            width: width,
            margin: const EdgeInsets.only(left: 16.0, right: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: AppColors.sideBoxColor.withOpacity(0.8),
                width: 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.greySColor.withOpacity(0.1),
                  blurRadius: 32.0,
                  spreadRadius: 2.0,
                  offset: const Offset(0.0, 4.0),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                timeBox(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 17.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(AppImages.personIcon,
                              height: 16.0,
                              width: 16.0,
                              fit: BoxFit.scaleDown,
                            ),
                            const SizedBox(width: 3.0),
                            const Text('John Doe',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: AppColors.greyColor,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w400,
                            ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(AppImages.telephoneIcon,
                              height: 16.0,
                              width: 16.0,
                              fit: BoxFit.scaleDown,
                            ),
                            const SizedBox(width: 3.0),
                            const Expanded(
                              child: Text('+880 6541 6464 123',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: AppColors.greyColor,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                              ),
                              ),
                            ),
                            SvgPicture.asset(AppImages.copyIcon),
                            const SizedBox(width: 12.0),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        const Divider(
                          thickness: 1.0,
                          color: AppColors.greyLightLColor,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 4.0),
                          child: Text('Address',
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyColor,
                            fontFamily: 'Manrope',
                          ),
                          ),
                        ),
                        const Text('971 S Pioneer Rd,Town	Beulah, Michigan',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                          color: AppColors.textThreeColor,
                        ),
                        ),
                        const SizedBox(height: 6.0),
                        const Divider(
                          thickness: 1.0,
                          color: AppColors.greyLightLColor,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 4.0),
                          child: Text('Notes',
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyColor,
                              fontFamily: 'Manrope',
                            ),
                          ),
                        ),
                        const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit '
                            'ut aliquam, purus sit amet lucts.',
                          style: TextStyle(
                            fontSize: 10.0,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                            color: AppColors.textThreeColor,
                          ),
                        ),
                        const SizedBox(height: 6.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          CustomButton(
            onTap: (){
              Get.to(OrderStartScreen());
            },
            btnColor: AppColors.mainColor,
            btnText: 'Start',
            margin: 16.0,
          ),
        ],
      ),
    );
  }

  Widget mapBox(height, width) => Container(
    height: height * 0.32,
    width: width,
    margin: const EdgeInsets.symmetric(horizontal: 16.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
    ),
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
  );

  Widget buttonsRow(width) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomButton(
            onTap: (){
              Get.bottomSheet(
                Container(
                  width: width,
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
                      const SizedBox(height: 5.0),
                      Center(
                        child: Container(
                          height: 5.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: AppColors.greyColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text('Order #:  46446546djgas461',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: AppColors.textThreeColor,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Manrope",
                        ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      orderDetail('Merchant', ': LOREAL', AppColors.textThreeColor),
                      const SizedBox(height: 3.0),
                      orderDetail('Items', ': 07', AppColors.textThreeColor),
                      const SizedBox(height: 3.0),
                      orderDetail('Amount', ': \$102.54', AppColors.mainColor),
                      const SizedBox(height: 3.0),
                      orderDetail('Status', ': UNPAID', AppColors.redColor),
                      const SizedBox(height: 12.0),
                      const Divider(
                        thickness: 1.0,
                        color: AppColors.greyLightLColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Expanded(flex: 1,child: Text('#',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: AppColors.textThreeColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Manrope',
                            ),
                            )),
                            const Expanded(flex: 2,child: Text('Description',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                              color: AppColors.textThreeColor,
                            ),
                            ),),
                            const Expanded(flex: 1, child: Text('Qty',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: AppColors.textThreeColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Manrope',
                              ),
                            )),
                            const Expanded(flex: 2,child: Text('Price',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: AppColors.textThreeColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Manrope',
                              ),
                            )),
                            SvgPicture.asset(AppImages.checkBoxIcon),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1.0,
                        color: AppColors.greyLightLColor,
                      ),
                      orderNumberRow('1'),
                      orderNumberRow('2'),
                      orderNumberRow('3'),
                      orderNumberRow('4'),
                      orderNumberRow('5'),
                      orderNumberRow('6'),
                      orderNumberRow('7'),
                      const SizedBox(height: 32.0),
                    ],
                  ),
                ),
                isScrollControlled: true,
              );
            },
            btnColor: Colors.white,
            borderColor: AppColors.greyLightLColor,
            btnText: 'Order details',
            fontColor: AppColors.blackColor,
            fontSize: 14.0,
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: CustomButton(
            onTap: (){},
            btnColor: Colors.white,
            borderColor: AppColors.greyLightLColor,
            btnText: 'ETA 40:25 min',
            fontColor: AppColors.blackColor,
            fontSize: 14.0,
          ),
        ),
      ],
    ),
  );

  Widget timeBox() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 16.0),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        bottomLeft: Radius.circular(8.0),
      ),
      color: AppColors.mainColor,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Mon,20 Jan ',
          style: TextStyle(
            fontSize: 10.0,
            color: AppColors.sideBoxColor,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5.0),
        const Text('After',
          style: TextStyle(
            fontSize: 10.0,
            color: AppColors.sideBoxColor,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5.0),
        RichText(
          textAlign: TextAlign.end,
          text: const TextSpan(
            children: [
              TextSpan(
                text: '6:30',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Manrope',
                ),
              ),
              TextSpan(
                text: 'am',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Manrope',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        SvgPicture.asset(AppImages.lineIcon),
        const SizedBox(height: 8.0),
        const Text('Mon,20 Jan ',
          style: TextStyle(
            fontSize: 10.0,
            color: AppColors.sideBoxColor,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5.0),
        const Text('Before',
          style: TextStyle(
            fontSize: 10.0,
            color: AppColors.sideBoxColor,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5.0),
        RichText(
          textAlign: TextAlign.end,
          text: const TextSpan(
            children: [
              TextSpan(
                text: '6:30',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Manrope',
                ),
              ),
              TextSpan(
                text: 'pm',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Manrope',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        RichText(
          textAlign: TextAlign.end,
          text: const TextSpan(
            children: [
              TextSpan(
                text: '2000',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Manrope',
                ),
              ),
              TextSpan(
                text: 'km',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Manrope',
                ),
              ),
            ],
          ),
        ),

      ],
    ),
  );

  Widget orderDetail(firstText, secondText, secondTextColor) => Padding(
    padding: const EdgeInsets.only(left: 16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(firstText,
            style: const TextStyle(
              fontSize: 12.0,
              color: AppColors.textThreeColor,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          child: Text(secondText!,
            style: TextStyle(
              fontSize: 12.0,
              color: secondTextColor,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Expanded(flex: 3,child: SizedBox()),
      ],
    ),
  );

  Widget orderNumberRow(serialNumber) =>  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 1,child: Text(serialNumber,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14.0,
            color: AppColors.textThreeColor,
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope',
          ),
        )),
        const Expanded(flex: 2,child: Text('Lorem iplsum 200',
          style: TextStyle(
            fontSize: 12.0,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w400,
            color: AppColors.greyColor,
          ),
        ),),
        const Expanded(flex: 1, child: Text('2',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.0,
            color: AppColors.textThreeColor,
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope',
          ),
        )),
        const Expanded(flex: 2,child: Text('\$10',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.0,
            color: AppColors.textThreeColor,
            fontWeight: FontWeight.w700,
            fontFamily: 'Manrope',
          ),
        )),
        SvgPicture.asset(AppImages.checkBoxIcon),
      ],
    ),
  );
}
