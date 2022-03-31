import 'package:flutter/material.dart';

import '../../../../../../res/app_colors.dart';
import '../../../../../../res/app_images.dart';


class ChatBoxWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final bool? isOnline;
  final bool? isPending;
  final String? nameText;
  final String? timeText;
  final String? msgText;
  final String? pendingText;

  const ChatBoxWidget({Key? key,
    this.onTap,
    this.isOnline = true,
    this.nameText = 'Samuel',
    this.timeText = '3:32 am',
    this.msgText = 'Msg Text',
    this.isPending = true,
    this.pendingText = '1',
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.0,
                color: AppColors.greyColor.withOpacity(0.2),
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 28.0,
                    backgroundImage: AssetImage(AppImages.personImage),
                  ),
                 isOnline == true ? Positioned(
                    right: 0.0,
                    child: Container(
                      height: 16.0,
                      width: 16.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.greenDarkColor,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ) : const SizedBox(),
                ],
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(nameText!,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: AppColors.textThreeColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(timeText!,
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(msgText!,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: AppColors.greyToggleColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        isPending == true ? Container(
                          height: 24.0,
                          width: 24.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.mainColor,
                          ),
                          child: Center(
                            child: Text(pendingText!,
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ) : const SizedBox(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      color: Colors.transparent,
    );
  }
}
