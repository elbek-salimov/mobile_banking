import 'package:flutter/material.dart';
import 'package:size_util/size_util.dart';

import '../../../../../utils/styles/app_text_styles.dart';

class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {

  int genderIndex = 0;
  int purposeIndex = 0;
  int occupationIndex = 0;
  int profitIndex = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: 27.w, right: 37.w, bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Text(
              'National ID',
              style: AppTextStyle.interSemiBold.copyWith(fontSize: 22),
            ),
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: RichText(
              text: TextSpan(
                text: 'Check your ',
                style: AppTextStyle.interMedium
                    .copyWith(fontSize: 12, color: Colors.grey),
                children: [
                  TextSpan(
                    text: 'National ID ',
                    style: AppTextStyle.interBold
                        .copyWith(fontSize: 12, color: Colors.green),
                  ),
                  TextSpan(
                    text: 'information',
                    style: AppTextStyle.interMedium
                        .copyWith(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 36.h),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Text(
              'Gender',
              style: AppTextStyle.interMedium.copyWith(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Radio(
                activeColor: Colors.green,
                value: 1,
                groupValue: genderIndex,
                onChanged: (v){
                  setState(() {
                    genderIndex = v!;
                  });
                },
              ),
              Text('Male', style: AppTextStyle.interMedium),
              const Spacer(),
              Radio(
                activeColor: Colors.green,
                value: 2,
                groupValue: genderIndex,
                onChanged: (v){
                  setState(() {
                    genderIndex = v!;
                  });
                },
              ),
              Text('Female', style: AppTextStyle.interMedium),
              const Spacer(),
              Radio(
                activeColor: Colors.green,
                value: 3,
                groupValue: genderIndex,
                onChanged: (v){
                  setState(() {
                    genderIndex = v!;
                  });
                },
              ),
              Text('Others', style: AppTextStyle.interMedium),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 10.w, top: 5.h, bottom: 16.h),
            height: 1.h,
            color: Colors.grey,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Text(
              'Purpose of Transaction',
              style: AppTextStyle.interMedium.copyWith(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Radio(
                activeColor: Colors.green,
                value: 1,
                groupValue: purposeIndex,
                onChanged: (v){
                  setState(() {
                    purposeIndex = v!;
                  });
                },
              ),
              Text('Personal', style: AppTextStyle.interMedium),
              const Spacer(),
              Radio(
                activeColor: Colors.green,
                value: 2,
                groupValue: purposeIndex,
                onChanged: (v){
                  setState(() {
                    purposeIndex = v!;
                  });
                },
              ),
              Text('Others', style: AppTextStyle.interMedium),
              const Spacer(),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 10.w, top: 5.h, bottom: 16.h),
            height: 1.h,
            color: Colors.grey,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Text(
              'Occupation',
              style: AppTextStyle.interMedium.copyWith(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Wrap(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    activeColor: Colors.green,
                    value: 1,
                    groupValue: occupationIndex,
                    onChanged: (v){
                      setState(() {
                        occupationIndex = v!;
                      });
                    },
                  ),
                  Text('Service', style: AppTextStyle.interMedium),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    activeColor: Colors.green,
                    value: 2,
                    groupValue: occupationIndex,
                    onChanged: (v){
                      setState(() {
                        occupationIndex = v!;
                      });
                    },
                  ),
                  Text('Business', style: AppTextStyle.interMedium),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    activeColor: Colors.green,
                    value: 3,
                    groupValue: occupationIndex,
                    onChanged: (v){
                      setState(() {
                        occupationIndex = v!;
                      });
                    },
                  ),
                  Text('Housewife', style: AppTextStyle.interMedium),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    activeColor: Colors.green,
                    value: 4,
                    groupValue: occupationIndex,
                    onChanged: (v){
                      setState(() {
                        occupationIndex = v!;
                      });
                    },
                  ),
                  Text('Student', style: AppTextStyle.interMedium),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    activeColor: Colors.green,
                    value: 5,
                    groupValue: occupationIndex,
                    onChanged: (v){
                      setState(() {
                        occupationIndex = v!;
                      });
                    },
                  ),
                  Text('Others', style: AppTextStyle.interMedium),
                ],
              ),
              const Spacer(),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 10.w, top: 5.h, bottom: 16.h),
            height: 1.h,
            color: Colors.grey,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Text(
              'Profit',
              style: AppTextStyle.interMedium.copyWith(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Radio(
                activeColor: Colors.green,
                value: 1,
                groupValue: profitIndex,
                onChanged: (v){
                  setState(() {
                    profitIndex = v!;
                  });
                },
              ),
              Text('Yes', style: AppTextStyle.interMedium),
              const Spacer(),
              Radio(
                activeColor: Colors.green,
                value: 2,
                groupValue: profitIndex,
                onChanged: (v){
                  setState(() {
                    profitIndex = v!;
                  });
                },
              ),
              Text('No', style: AppTextStyle.interMedium),
              const Spacer(),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 10.w, top: 5.h, bottom: 16.h),
            height: 1.h,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
