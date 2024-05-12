import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_banking/utils/images/app_images.dart';
import 'package:size_util/size_util.dart';

import '../../../../utils/styles/app_text_styles.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Support',
          style: AppTextStyle.interSemiBold
              .copyWith(color: Colors.green, fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 17.w, right: 17.w, top: 40.h, bottom: 24.h),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 18.h),
                          decoration: BoxDecoration(
                            color: Colors.green.shade800,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: Text(
                            'What is the best programming language?',
                            style: AppTextStyle.interBold.copyWith(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 27.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20.h,
                          child: const Icon(Icons.person),
                        ),
                        SizedBox(width: 7.w),
                        Container(
                          margin: EdgeInsets.only(bottom: 60.h),
                          padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 18.h),
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Hello,i’m fine,how can i help you?',
                            style: AppTextStyle.interBold.copyWith(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 18.h),
                          decoration: BoxDecoration(
                            color: Colors.green.shade800,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: Text(
                            'What is the best programming language?',
                            style: AppTextStyle.interBold.copyWith(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 27.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20.h,
                          child: const Icon(Icons.person),
                        ),
                        SizedBox(width: 7.w),
                        Container(
                          margin: EdgeInsets.only(bottom: 60.h),
                          padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 18.h),
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Hello,i’m fine,how can i help you?',
                            style: AppTextStyle.interBold.copyWith(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 18.h),
                          decoration: BoxDecoration(
                            color: Colors.green.shade800,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: Text(
                            'What is the best programming language?',
                            style: AppTextStyle.interBold.copyWith(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 27.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20.h,
                          child: const Icon(Icons.person),
                        ),
                        SizedBox(width: 7.w),
                        Container(
                          margin: EdgeInsets.only(bottom: 60.h),
                          padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 18.h),
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Hello,i’m fine,how can i help you?',
                            style: AppTextStyle.interBold.copyWith(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 5),
                    ),
                  ]),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Write your message',
                  hintStyle: AppTextStyle.interBold
                      .copyWith(fontSize: 13, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(30)),
                  suffixIcon: Material(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          splashRadius: 20.w,
                          onPressed: () {},
                          icon: SvgPicture.asset(AppImages.microphone),
                        ),
                        IconButton(
                          splashRadius: 20.w,
                          onPressed: () {},
                          icon: SvgPicture.asset(AppImages.send),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
