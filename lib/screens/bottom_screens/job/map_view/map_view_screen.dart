import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../res/app_colors.dart';
import '../../../../res/app_images.dart';

class MapViewScreen extends StatelessWidget {
  const MapViewScreen({Key? key}) : super(key: key);

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
        title: const Text('Map view',
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
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            const GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(40.587968, 60.814708),
                zoom: 8,
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
              bottom: 200,
              left: 36.0,
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.warningSkyColor,
                  border: Border.all(
                    color: Colors.white,
                    width: 4.0,
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
  }
}
