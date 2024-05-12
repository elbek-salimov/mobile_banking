import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_banking/screens/widgets/global_password_field.dart';
import 'package:mobile_banking/screens/widgets/global_textfield.dart';
import 'package:mobile_banking/screens/routes.dart';
import 'package:mobile_banking/utils/constants/app_constants.dart';
import 'package:mobile_banking/utils/images/app_images.dart';
import 'package:mobile_banking/utils/styles/app_text_styles.dart';
import 'package:size_util/size_util.dart';

import '../../blocs/auth/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formKeyOne = GlobalKey<FormState>();
  final _formKeyTwo = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.green),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 48.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login to light',
                  style: AppTextStyle.interSemiBold.copyWith(fontSize: 20),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Login to Light is your pathway to a seamless digital experience.',
                  style: AppTextStyle.interRegular
                      .copyWith(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 30.h),
                Text(
                  'Email',
                  style: AppTextStyle.interMedium.copyWith(fontSize: 14),
                ),
                SizedBox(height: 5.h),
                GlobalTextField(
                  formKey: _formKeyOne,
                  validateEmptyText: 'Enter email',
                  validate: AppConstants.emailRegExp,
                  validateText: 'Incorrect email',
                  title: 'Email',
                  icon: const Icon(Icons.email, color: Colors.green),
                  controller: emailController,
                ),
                SizedBox(height: 26.h),
                Text(
                  'Password',
                  style: AppTextStyle.interMedium.copyWith(fontSize: 14),
                ),
                SizedBox(height: 5.h),
                GlobalPasswordField(
                  formKey: _formKeyTwo,
                  validate: AppConstants.passwordRegExp,
                  title: 'Password',
                  icon: const Icon(Icons.lock, color: Colors.green),
                  controller: passwordController,
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.passwordResetScreen);
                      },
                      child: Text(
                        'Forgot password',
                        style: AppTextStyle.interMedium
                            .copyWith(color: Colors.green, fontSize: 12),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Privacy Policy',
                        style: AppTextStyle.interMedium
                            .copyWith(color: Colors.green, fontSize: 12),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 50.h),
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      final isValidateOne =
                          _formKeyOne.currentState!.validate();
                      final isValidateTwo =
                          _formKeyTwo.currentState!.validate();
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty &&
                          isValidateOne &&
                          isValidateTwo) {
                        context.read<AuthBloc>().add(
                              LoginUserEvent(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                      }
                    },
                    child: Text(
                      'Continue',
                      style:
                          AppTextStyle.interBold.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onPressed: () {
                      context.read<AuthBloc>().add(SignInWithGoogleEvent());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.h,
                          child: Image.asset(AppImages.google),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Google',
                          style: AppTextStyle.interSemiBold.copyWith(
                            fontSize: 20,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
