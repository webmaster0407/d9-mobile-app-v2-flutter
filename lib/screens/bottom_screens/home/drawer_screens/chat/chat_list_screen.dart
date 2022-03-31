import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/app_colors.dart';
import 'components/chat_box_widget.dart';
import 'components/chat_personal_screen.dart';
import 'controller/chat_controller.dart';

class ChatListScreen extends GetView<ChatController> {
  ChatListScreen({Key? key}) : super(key: key);

  final ChatController chatController = Get.put(ChatController());

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
        title: const Text('Chat',
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

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 24.0),
          ChatBoxWidget(
            msgText: 'Good morning, did you sleep well?',
            onTap: (){
              Get.to(ChatPersonalScreen());
            },
          ),
          ChatBoxWidget(
            isOnline: false,
            isPending: false,
            nameText: 'Jonas',
            msgText: 'Good morning, did you sleep well?',
            timeText: 'Yesterday',
            onTap: (){
              Get.to(ChatPersonalScreen());
            },
          ),
          ChatBoxWidget(
            nameText: 'Nick',
            msgText: 'Good morning, did you sleep well?',
            pendingText: '4',
            timeText: '3 Feb',
            onTap: (){
              Get.to(ChatPersonalScreen());
            },
          ),
          ChatBoxWidget(
            nameText: 'Sarrah',
            msgText: 'Good morning, did you sleep well?',
            pendingText: '1',
            timeText: '4 Feb',
            onTap: (){
              Get.to(ChatPersonalScreen());
            },
          ),
        ],
      ),
    );
  }

}