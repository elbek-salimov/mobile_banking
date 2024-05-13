import 'package:flutter/material.dart';
import 'package:size_util/size_util.dart';

import '../../../../../utils/images/app_images.dart';
import '../../../../../utils/styles/app_text_styles.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Padding(
      padding:
      EdgeInsets.only(left: 17.w, right: 17.w, top: 40.h, bottom: 24.h),
      child: Column(
        children: [
          Text(
            'National ID',
            style: AppTextStyle.interSemiBold.copyWith(fontSize: 22),
          ),
          SizedBox(height: 4.h),
          Text(
            'Scan the front side of NID card with camera',
            style: AppTextStyle.interMedium
                .copyWith(fontSize: 12, color: Colors.grey),
          ),
          SizedBox(height: 30.h),
          Stack(
            children: [
              Image.asset(AppImages.nationalIdCardFront),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(13.w),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green.shade700),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 30.h),
          Text(
            'Scan the back side of NID card with camera',
            style: AppTextStyle.interMedium
                .copyWith(fontSize: 12, color: Colors.grey),
          ),
          SizedBox(height: 17.h),
          Stack(
            children: [
              Image.asset(AppImages.nationalIdCardBack),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(13.w),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green.shade700),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
