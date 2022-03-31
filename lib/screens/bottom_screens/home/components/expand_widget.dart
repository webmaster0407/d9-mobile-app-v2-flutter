import 'package:delivery_app/res/app_images.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../../../res/app_colors.dart';



class ExpandWidget extends StatelessWidget {
  const ExpandWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return ExpandablePanel(
      theme: const ExpandableThemeData(
        useInkWell: false,
        hasIcon: false,
      ),
      header: Padding(
        padding: const EdgeInsets.only(left: 20.0, bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text('Pixel Navy LTD.',
              style: TextStyle(
                fontSize: 13.0,
                color: AppColors.greyLightLColor,
                fontWeight: FontWeight.w400,
                fontFamily: 'Manrope',
              ),
            ),
            Spacer(),
            Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white, size: 22.0),
            SizedBox(width: 16.0),
          ],
        ),
      ),
      collapsed: const SizedBox(),
      expanded: Container(
        width: width,
        decoration: const BoxDecoration(
          color: AppColors.mainOneColor,
        ),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    CircleAvatar(
                      radius: 18.0,
                      backgroundImage: AssetImage(AppImages.personImage),
                    ),
                    SizedBox(width: 8.0),
                    Text('Pixel Navy LTD.',
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Manrope',
                    ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    CircleAvatar(
                      radius: 18.0,
                      backgroundImage: AssetImage(AppImages.personImage),
                    ),
                    SizedBox(width: 8.0),
                    Text('Sundarban Courier Pvt LTD.',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    CircleAvatar(
                      radius: 18.0,
                      backgroundImage: AssetImage(AppImages.personImage),
                    ),
                    SizedBox(width: 8.0),
                    Text('Satoshi Services',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  color: AppColors.dividerColor,
                  thickness: 1.5,
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
