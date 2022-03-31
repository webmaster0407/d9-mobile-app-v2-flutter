import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../widgets/utils.dart';
import '../controller/order_start_controller.dart';
import 'item_status_sheet.dart';

class DetailsSheet extends StatelessWidget {
  DetailsSheet({Key? key}) : super(key: key);

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
                GestureDetector(
                    onTap: (){
                      Get.back();
                      Get.bottomSheet(
                        ItemStatusSheet(),
                        isScrollControlled: true,
                      );
                    },
                    child: SvgPicture.asset(AppImages.checkBoxIcon, color: AppColors.mainColor),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1.0,
            color: AppColors.greyLightLColor,
          ),
          orderNumberRow('1', AppColors.warningSkyColor),
          orderNumberRow('2', AppColors.greyColor),
          orderNumberRow('3', AppColors.redColor),
          orderNumberRow('4', AppColors.yellowColor),
          orderNumberRow('5', AppColors.warningSkyColor),
          orderNumberRow('6', AppColors.warningSkyColor),
          orderNumberRow('7', AppColors.warningSkyColor),
          const SizedBox(height: 32.0),
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

  Widget orderNumberRow(serialNumber, checkBoxColor) =>  Padding(
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
        SvgPicture.asset(AppImages.checkBoxIcon, color: checkBoxColor),
      ],
    ),
  );
}
