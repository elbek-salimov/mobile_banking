import 'package:flutter/material.dart';
import 'package:mobile_banking/screens/tab/profile/verification/pages/page_one.dart';
import 'package:mobile_banking/screens/tab/profile/verification/pages/page_three.dart';
import 'package:mobile_banking/screens/tab/profile/verification/pages/page_two.dart';
import 'package:size_util/size_util.dart';

import '../../../../utils/styles/app_text_styles.dart';

class KycVerificationScreen extends StatefulWidget {
  const KycVerificationScreen({super.key});

  @override
  State<KycVerificationScreen> createState() => _KycVerificationScreenState();
}

class _KycVerificationScreenState extends State<KycVerificationScreen> {
  final PageController controller = PageController();

  int activeIndex = 0;

  TextEditingController nidNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'KYC Verification',
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
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (index) {},
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const PageOne(),
                PageTwo(nidNumberController: nidNumberController),
                const PageThree(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width / 4,
                  child: Visibility(
                    visible: activeIndex != 0,
                    child: TextButton(
                      onPressed: () {
                        if (activeIndex > 0) {
                          setState(() {
                            activeIndex--;
                            controller.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear,
                            );
                          });
                        }
                      },
                      child: Text(
                        'BACK',
                        style:
                            AppTextStyle.interSemiBold.copyWith(fontSize: 14),
                      ),
                    ),
                  ),
                ),
                Text(
                  '${activeIndex + 1}/3',
                  style: AppTextStyle.interMedium
                      .copyWith(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(
                  width: width / 4,
                  child: TextButton(
                    onPressed: () {
                      if (activeIndex < 2) {
                        setState(() {
                          activeIndex++;
                          controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear,
                          );
                        });
                      }
                      if(nidNumberController.text.isNotEmpty){
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                contentPadding: EdgeInsets.only(
                                  left: 30.w,
                                  right: 30.w,
                                  top: 90.h,
                                  bottom: 90.h,
                                ),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      size: 87.w,
                                      color: Colors.green,
                                    ),
                                    SizedBox(height: 37.h),
                                    Text(
                                      textAlign: TextAlign.center,
                                      'Verification Successful!',
                                      style: AppTextStyle.interBold.copyWith(
                                        fontSize: 22,
                                        color: Colors.green,
                                      ),
                                    ),
                                    SizedBox(height: 7.h),
                                    Text(
                                      'Your account has been verified',
                                      style: AppTextStyle.interRegular
                                          .copyWith(fontSize: 13),
                                    ),
                                    SizedBox(height: 30.h),
                                    SizedBox(
                                      height: 41.h,
                                      width: double.infinity,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor:
                                          Colors.green.withOpacity(0.2),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Back To Home',
                                          style:
                                          AppTextStyle.interMedium.copyWith(
                                            fontSize: 12,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                      }
                    },
                    child: Text(
                      'NEXT',
                      style: AppTextStyle.interSemiBold
                          .copyWith(fontSize: 14, color: Colors.green),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
