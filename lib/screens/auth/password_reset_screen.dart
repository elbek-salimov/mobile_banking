import 'package:flutter/material.dart';
import 'package:mobile_banking/screens/auth/widgets/global_textfield.dart';
import 'package:size_util/size_util.dart';
import '../../utils/styles/app_text_styles.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Icon(Icons.lock, size: width / 3, color: Colors.green),
              SizedBox(height: 36.h),
              Text('Forgot Password',
                  style: AppTextStyle.interSemiBold),
              SizedBox(height: 26.h),
              Text(
                  'Provide your email and we will send you a link to reset your password',
                  style:
                  AppTextStyle.interLight.copyWith(fontSize: 18)),
              SizedBox(height: 20.h),
              GlobalTextField(
                title: 'Email',
                icon: const Icon(Icons.email),
                controller: emailController,
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 17.w, right: 17.w),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {

                  },
                  child: Ink(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        'RESET',
                        style: AppTextStyle.interSemiBold.copyWith(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 13.h),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Go Back',
                  style:
                  AppTextStyle.interMedium.copyWith(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
