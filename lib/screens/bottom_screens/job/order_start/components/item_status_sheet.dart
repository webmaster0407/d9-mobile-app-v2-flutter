import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../widgets/utils.dart';
import '../controller/order_start_controller.dart';

class ItemStatusSheet extends StatelessWidget {
  ItemStatusSheet({Key? key}) : super(key: key);

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
      child: SingleChildScrollView(
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
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text('Item status',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Manrope',
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text('Please select item status',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Manrope',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0),

            toggleCircleButton('Delivered', AppColors.warningSkyColor, Colors.white),
            toggleCircleButton('Missing', AppColors.yellowColor, Colors.white),
            toggleCircleButton('Returned', AppColors.redColor, AppColors.redColor),

            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 20.0),
              child: Text('Additional Note',
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
                controller: orderStartController.additionNoteController,
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
              child: Text('Accesibility',
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w400,
                  color: AppColors.warningColor,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  Widget toggleCircleButton(text, toggleColor, activeColor) => Padding(
    padding: const EdgeInsets.only(left: 16.0, bottom: 12.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 18.0,
          width: 18.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: toggleColor,
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: activeColor,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12.0),
        Text(text,
          style: const TextStyle(
            fontSize: 13.0,
            color: AppColors.textThreeColor,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
