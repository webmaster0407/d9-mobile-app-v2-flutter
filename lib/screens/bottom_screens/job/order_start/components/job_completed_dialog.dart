import 'package:flutter/material.dart';

import '../../../../../widgets/utils.dart';

class JobCompletedDialog extends StatelessWidget {
  const JobCompletedDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 32.0, top: 12.0),
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 64.0,
                width: 64.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.mainColor,
                ),
                child: const Center(
                  child: Icon(Icons.check, color: Colors.white, size: 48.0),
                ),
              ),
              const SizedBox(height: 32.0),
              const Text('Job Completed \nSuccessfully!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Manrope',
                  color: AppColors.greyDarkColor,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text('Congratulations!, this job has been marked '
                  '\nas completed. Please visit job history page '
                  '\nto review completed jobs.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Manrope',
                  color: AppColors.greyColor,
                ),
              ),
              const SizedBox(height: 16.0),
              CustomButton(
                onTap: (){

                },
                btnText: 'Okay!',
                width: width * 0.24,
                fontSize: 12.0,
                height: 36.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
