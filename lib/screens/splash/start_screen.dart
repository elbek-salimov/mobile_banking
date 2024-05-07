import 'package:flutter/material.dart';
import 'package:mobile_banking/screens/routes.dart';
import 'package:mobile_banking/utils/images/app_images.dart';
import 'package:mobile_banking/utils/styles/app_text_styles.dart';
import 'package:size_util/size_util.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 31.w, right: 31.w, top: 134.h, bottom: 50.h),
        child: Column(
          children: [
            Image.asset(AppImages.startImage),
            const Spacer(),
            Text(
              'Welcome to Light',
              style: AppTextStyle.interMedium.copyWith(fontSize: 26),
            ),
            SizedBox(height: 26.h),
            SizedBox(
              width: double.infinity,
              height: 55.h,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.registerRoute);
                },
                child: Text(
                  'Create new account',
                  style: AppTextStyle.interMedium.copyWith(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 28.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'I already have an',
                  style: AppTextStyle.interRegular.copyWith(fontSize: 13),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.loginRoute);
                  },
                  child: Text(
                    'account',
                    style: AppTextStyle.interRegular
                        .copyWith(fontSize: 13, color: Colors.green),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
