import 'package:delivery_app/screens/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:get/get.dart';

import '../../../../../res/app_colors.dart';
import 'components/shift_one_expand.dart';
import 'components/shift_two_expand.dart';
import 'controller/shift_controller.dart';

class ShiftScreen extends GetView<ShiftController> {
  ShiftScreen({Key? key}) : super(key: key);

  final ShiftController shiftController = Get.put(ShiftController());

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
          'Shifts',
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
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios_outlined,
                      size: 16.0, color: Colors.black,
                  ),
                ),
                const Text('2022',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w700,
                  color: AppColors.textThreeColor,
                ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios_outlined,
                    size: 16.0, color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              child: DatePicker(
                DateTime.now(),
                width: 60,
                height: 80,
                controller: shiftController.controller,
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.mainColor,
                selectedTextColor: Colors.white,
                deactivatedColor: AppColors.textTwoColor,
                inactiveDates: const [
                  /*DateTime.now().add(Duration(days: 3)),
                  DateTime.now().add(Duration(days: 4)),
                  DateTime.now().add(Duration(days: 7))*/
                ],
                onDateChange: (date) {
                  shiftController.selectedValue = date;
                },
              ),
            ),
            const SizedBox(height: 36.0),
            const ShiftOneExpand(),
            const SizedBox(height: 12.0),
            const ShiftTwoExpand(),
          ],
        ),
      ),
    );
  }

}
