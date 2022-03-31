import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:get/get.dart';

class ShiftController extends GetxController {
  DatePickerController controller = DatePickerController();

  DateTime selectedValue = DateTime.now();
}