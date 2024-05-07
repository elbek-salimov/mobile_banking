import 'package:flutter/material.dart';
import 'package:mobile_banking/screens/auth/widgets/global_textfield.dart';
import 'package:mobile_banking/utils/constants/app_constants.dart';
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

  final _formKey = GlobalKey<FormState>();

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
                formKey: _formKey,
                validateEmptyText: 'Enter email',
                validateText: 'Incorrect email',
                validate: AppConstants.emailRegExp,
                title: 'Email',
                icon: const Icon(Icons.email, color: Colors.green),
                controller: emailController,
              ),
              SizedBox(height: 30.h),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    final isValidate = _formKey.currentState!.validate();
                    if(isValidate && emailController.text.isNotEmpty){
                      // TODO reset password
                    }
                  },
                  child: Text(
                    'Reset',
                    style: AppTextStyle.interBold.copyWith(color: Colors.white),
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
