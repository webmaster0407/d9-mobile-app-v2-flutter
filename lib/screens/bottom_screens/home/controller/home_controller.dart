import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxBool online = false.obs;

  //void onlineToggle() => online.value = online.value ? false : true;

}