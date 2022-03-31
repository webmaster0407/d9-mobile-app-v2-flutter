import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../widgets/utils.dart';
import '../controller/order_start_controller.dart';

class DetailNoteSheet extends StatelessWidget {
  DetailNoteSheet({Key? key}) : super(key: key);

  final OrderStartController orderStartController = Get.put(OrderStartController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
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
          orderDetail('Amount Due', ': \$102.54', AppColors.mainColor),
          const SizedBox(height: 3.0),
          orderDetail('Balance', ': \$10.54', AppColors.redColor),
          const SizedBox(height: 24.0),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text('Enter amount you received',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: 'Manrope',
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            height: 50.0,
            width: width,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(
                color: AppColors.greyLightLColor,
                width: 1.0,
              ),
            ),
            child: TextFormField(
              controller: orderStartController.amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 16.0),
                hintText: '92',
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(AppImages.checkBoxIcon, color: AppColors.mainColor),
                const SizedBox(width: 5.0),
                const Text('Accept partial payment',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          CustomButton(
            onTap: (){
              Get.back();
              Get.bottomSheet(
                deliveryNoteSheet(width),
                isScrollControlled: true,
              );
            },
            btnText: 'Continue',
            margin: 16.0,
          ),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }

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

  Widget deliveryNoteSheet(width) =>  Container(
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
        const SizedBox(height: 32.0),
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text('Write a delivery note here',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontFamily: 'Manrope',
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          width: width,
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.greyLightLColor.withOpacity(0.5),
          ),
          child: TextFormField(
            controller: orderStartController.maxWordsController,
            keyboardType: TextInputType.text,
            maxLines: 10,
            inputFormatters: [
              LengthLimitingTextInputFormatter(150),
            ],
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 16.0, top: 16.0),
              hintText: 'Type here…',
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text('Maximum 150 words',
            style: TextStyle(
              fontSize: 14.0,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w400,
              color: AppColors.warningColor,
            ),
          ),
        ),
        const SizedBox(height: 50.0),
      ],
    ),
  );
}
