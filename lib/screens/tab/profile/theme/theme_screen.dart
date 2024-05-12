import 'package:flutter/material.dart';
import 'package:size_util/size_util.dart';

import '../../../../utils/styles/app_text_styles.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  bool isLight = true;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Theme',
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
        body: Padding(
          padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 40.h),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isLight = true;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                  child: Row(
                    children: [
                      SizedBox(width: 28.w),
                      Icon(
                        isLight ? Icons.check_circle : Icons.circle_outlined,
                        color: Colors.green,
                      ),
                      SizedBox(width: 20.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Light Theme',
                            style: AppTextStyle.interSemiBold
                                .copyWith(fontSize: 16),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'A Soothing Glow.',
                            style: AppTextStyle.interRegular
                                .copyWith(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 1 / 2.h,
                color: Colors.grey,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isLight = false;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                  child: Row(
                    children: [
                      SizedBox(width: 28.w),
                      Icon(
                        isLight ? Icons.circle_outlined : Icons.check_circle,
                        color: Colors.green,
                      ),
                      SizedBox(width: 20.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dark Theme',
                            style: AppTextStyle.interSemiBold
                                .copyWith(fontSize: 16),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Elegance in Shadows.',
                            style: AppTextStyle.interRegular
                                .copyWith(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
