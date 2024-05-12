import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_banking/screens/routes.dart';
import 'package:mobile_banking/utils/images/app_images.dart';
import 'package:mobile_banking/utils/styles/app_text_styles.dart';
import 'package:size_util/size_util.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/profile/profile_bloc.dart';
import '../../data/models/forms_state.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == FormsStatus.error) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
          if (state.status == FormsStatus.authenticated) {
            if (state.statusMessage == 'registered') {
              BlocProvider.of<ProfileBloc>(context)
                  .add(AddUserEvent(userModel: state.userModel));
            } else {
              BlocProvider.of<ProfileBloc>(context)
                  .add(GetUserByUuidEvent(state.userModel.uuid));
            }
            Navigator.pushNamedAndRemoveUntil(
                context, RouteNames.tabRoute, (route) => false);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
                left: 31.w, right: 31.w, top: 134.h, bottom: 50.h),
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
                      Navigator.pushNamed(context, RouteNames.registerScreen);
                    },
                    child: Text(
                      'Create new account',
                      style: AppTextStyle.interMedium
                          .copyWith(color: Colors.white),
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
                        Navigator.pushNamed(context, RouteNames.loginScreen);
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
          );
        },
      ),
    );
  }
}
