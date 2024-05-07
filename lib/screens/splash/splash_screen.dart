import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_banking/blocks/auth/auth_bloc.dart';
import 'package:mobile_banking/data/models/forms_state.dart';
import 'package:mobile_banking/utils/images/app_images.dart';
import 'package:mobile_banking/utils/styles/app_text_styles.dart';
import 'package:size_util/size_util.dart';

import '../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  _init(bool isAuthenticated) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (!mounted) return;

    if (!isAuthenticated) {
      Navigator.pushReplacementNamed(context, RouteNames.startRoute);
    } else {
      Navigator.pushReplacementNamed(context, RouteNames.tabRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state){
          if(state.status == FormsStatus.authenticated){
            _init(true);
          }else{
            _init(false);
          }
        },
        child: Column(
          children: [
            const Spacer(),
            Image.asset(AppImages.splashLogo),
            SizedBox(height: 220.h),
            const CircularProgressIndicator(color: Colors.green),
            SizedBox(height: 46.h),
            Text(
              'Version 1.0',
              style: AppTextStyle.interRegular.copyWith(fontSize: 12),
            ),
            SizedBox(height: 46.h),
          ],
        ),
      )
    );
  }
}
