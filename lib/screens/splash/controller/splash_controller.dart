import 'dart:async';

import 'package:get/get.dart';

import '../../landing/landing_screen.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    Timer(const Duration(seconds: 3),
        () => Get.to(LandingScreen()),
    );
  }

}