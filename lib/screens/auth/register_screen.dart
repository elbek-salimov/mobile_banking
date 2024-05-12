import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_banking/data/models/user_model.dart';
import 'package:mobile_banking/screens/widgets/global_password_field.dart';
import 'package:mobile_banking/screens/widgets/global_textfield.dart';
import 'package:mobile_banking/utils/constants/app_constants.dart';
import 'package:mobile_banking/utils/images/app_images.dart';
import 'package:mobile_banking/utils/styles/app_text_styles.dart';
import 'package:size_util/size_util.dart';

import '../../blocs/auth/auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formKeyOne = GlobalKey<FormState>();
  final _formKeyTwo = GlobalKey<FormState>();
  final _formKeyThree = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
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
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 28.h, bottom: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create your account',
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 20),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'User-friendly solutions. Join us now to unlock a brighter online journey.',
                    style: AppTextStyle.interRegular
                        .copyWith(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Name',
                    style: AppTextStyle.interMedium.copyWith(fontSize: 14),
                  ),
                  SizedBox(height: 5.h),
                  GlobalTextField(
                    formKey: _formKeyOne,
                    validateEmptyText: 'Enter name',
                    validateText: 'Incorrect name',
                    validate: AppConstants.textRegExp,
                    title: 'Name',
                    icon: const Icon(Icons.person, color: Colors.green),
                    controller: nameController,
                  ),
                  SizedBox(height: 26.h),
                  Text(
                    'Email',
                    style: AppTextStyle.interMedium.copyWith(fontSize: 14),
                  ),
                  SizedBox(height: 5.h),
                  GlobalTextField(
                    formKey: _formKeyTwo,
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
                    formKey: _formKeyThree,
                    validate: AppConstants.passwordRegExp,
                    title: 'Password',
                    icon: const Icon(Icons.lock, color: Colors.green),
                    controller: passwordController,
                  ),
                  SizedBox(height: 22.h),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.green,
                        value: true,
                        onChanged: (v) {},
                      ),
                      Expanded(
                        child: Text(
                          'I certify that I am 18 years of age or older,'
                          ' and I agree to the User Agreement and Privacy Policy',
                          style: AppTextStyle.interLight.copyWith(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),
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
                        final isValidateThree =
                            _formKeyThree.currentState!.validate();
                        if (isValidateOne && isValidateTwo && isValidateThree) {
                          context.read<AuthBloc>().add(
                                RegisterUserEvent(
                                  userModel: UserModel(
                                    userName: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    imageUrl: '',
                                    userId: '',
                                    fcm: '',
                                    uuid: '',
                                  ),
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
            ),
          );
        },
      ),
    );
  }
}
