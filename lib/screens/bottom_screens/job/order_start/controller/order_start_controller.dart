import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OrderStartController extends GetxController {

  TextEditingController amountController = TextEditingController();
  TextEditingController maxWordsController = TextEditingController();
  TextEditingController additionNoteController = TextEditingController();

  RxBool isDestination = true.obs;
  RxBool isProofDelivery = false.obs;
  RxBool isDeliverConfirm = false.obs;
  RxBool isComplete = false.obs;

  void isDestFun() {
    isDestination.value = true;
    isProofDelivery.value = false;
    isDeliverConfirm.value = false;
    isComplete.value = false;
  }

  void isProofDeliveryFun() {
    isDestination.value = false;
    isProofDelivery.value = true;
    isDeliverConfirm.value = false;
    isComplete.value = false;
  }

  void isDeliveryConfirmFun() {
    isDestination.value = false;
    isProofDelivery.value = true;
    isDeliverConfirm.value = true;
    isComplete.value = true;
  }
}