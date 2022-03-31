import 'package:delivery_app/res/app_colors.dart';
import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final String? text;
  final String? countText;
  final Color? textColor;

  const ProgressWidget({Key? key,
    this.text = 'Not Started',
    this.textColor = AppColors.notStartColor,
    this.countText = '1',
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 16.0,
            width: 16.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: textColor!,
            ),
            child:  Center(
              child: Text(countText!,
                style: const TextStyle(
                  fontSize: 10.0,
                  color: Colors.white,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: 5.0),
          Text(text!,
            style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.w400,
              fontFamily: 'Manrope',
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
