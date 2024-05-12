import 'package:flutter/material.dart';
import 'package:size_util/size_util.dart';

import '../../../../../utils/styles/app_text_styles.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key, required this.nidNumberController});

  final TextEditingController nidNumberController;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scrollbar(
      thickness: 5.w,
      child: SingleChildScrollView(
        child: Padding(
          padding:
          EdgeInsets.only(left: 37.w, right: 37.w, bottom: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Text(
                'National ID',
                style: AppTextStyle.interSemiBold.copyWith(fontSize: 22),
              ),
              SizedBox(height: 4.h),
              RichText(
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
              SizedBox(height: 34.h),
              Text(
                'NID Number',
                style: AppTextStyle.interMedium
                    .copyWith(fontSize: 10, color: Colors.grey),
              ),
              TextField(
                controller: nidNumberController,
              ),
              SizedBox(height: 21.h),
              Text(
                "Applicant's name",
                style: AppTextStyle.interMedium
                    .copyWith(fontSize: 10, color: Colors.grey),
              ),
              const TextField(),
              SizedBox(height: 21.h),
              Text(
                "Applicant's Father's name",
                style: AppTextStyle.interMedium
                    .copyWith(fontSize: 10, color: Colors.grey),
              ),
              const TextField(),
              SizedBox(height: 21.h),
              Text(
                "Applicant's Mother's name",
                style: AppTextStyle.interMedium
                    .copyWith(fontSize: 10, color: Colors.grey),
              ),
              const TextField(),
              SizedBox(height: 21.h),
              Text(
                'Date of Birth',
                style: AppTextStyle.interMedium
                    .copyWith(fontSize: 10, color: Colors.grey),
              ),
              const TextField(),
              SizedBox(height: 21.h),
              Text(
                "Present Address",
                style: AppTextStyle.interMedium
                    .copyWith(fontSize: 10, color: Colors.grey),
              ),
              const TextField(),
              SizedBox(height: 21.h),
              Text(
                "Permanent Address",
                style: AppTextStyle.interMedium
                    .copyWith(fontSize: 10, color: Colors.grey),
              ),
              const TextField(),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    activeColor: Colors.green,
                    value: true,
                    onChanged: (v) {},
                  ),
                  Text(
                    'Same as present address',
                    style: AppTextStyle.interMedium.copyWith(
                      fontSize: 12,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
