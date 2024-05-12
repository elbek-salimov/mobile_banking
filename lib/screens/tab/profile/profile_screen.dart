import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_banking/screens/routes.dart';
import 'package:mobile_banking/utils/images/app_images.dart';
import 'package:mobile_banking/utils/styles/app_text_styles.dart';
import 'package:size_util/size_util.dart';

import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/profile/profile_bloc.dart';
import '../../../data/models/forms_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: AppTextStyle.interSemiBold
              .copyWith(color: Colors.green, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 40.h),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 18.w),
                    CircleAvatar(
                      radius: 30.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(state.userModel.imageUrl.isEmpty
                            ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'
                            : state.userModel.imageUrl),
                      ),
                    ),
                    SizedBox(width: 18.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.userModel.userName,
                          style:
                              AppTextStyle.interSemiBold.copyWith(fontSize: 22),
                        ),
                        Text(
                          state.userModel.email,
                          style: AppTextStyle.interRegular
                              .copyWith(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.profileEditScreen);
                      },
                      icon: const Icon(Icons.drive_file_rename_outline_rounded),
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
                SizedBox(height: 57.h),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.kycVerificationScreen);
                  },
                  child: Ink(
                    padding: EdgeInsets.only(bottom: 8.h, top: 8.h),
                    child: Row(
                      children: [
                        SizedBox(width: 28.w),
                        Image.asset(AppImages.kyc, height: 20.h, width: 20.h),
                        SizedBox(width: 20.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'KYC Verification',
                              style: AppTextStyle.interSemiBold
                                  .copyWith(fontSize: 16),
                            ),
                            Text(
                              'Trust and Security',
                              style: AppTextStyle.interRegular
                                  .copyWith(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h, bottom: 12.h),
                  height: 1 / 2.h,
                  color: Colors.grey,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.themeScreen);
                  },
                  child: Ink(
                    padding: EdgeInsets.only(bottom: 8.h, top: 8.h),
                    child: Row(
                      children: [
                        SizedBox(width: 28.w),
                        Image.asset(AppImages.theme, height: 20.h, width: 20.h),
                        SizedBox(width: 20.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Theme',
                              style: AppTextStyle.interSemiBold
                                  .copyWith(fontSize: 16),
                            ),
                            Text(
                              'Personalize Your Style',
                              style: AppTextStyle.interRegular
                                  .copyWith(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h, bottom: 12.h),
                  height: 1 / 2.h,
                  color: Colors.grey,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.notificationScreen);
                  },
                  child: Ink(
                    padding: EdgeInsets.only(bottom: 8.h, top: 8.h),
                    child: Row(
                      children: [
                        SizedBox(width: 28.w),
                        Image.asset(AppImages.notification,
                            height: 20.h, width: 20.h),
                        SizedBox(width: 20.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Notification',
                              style: AppTextStyle.interSemiBold
                                  .copyWith(fontSize: 16),
                            ),
                            Text(
                              'Stay Informed',
                              style: AppTextStyle.interRegular
                                  .copyWith(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h, bottom: 12.h),
                  height: 1 / 2.h,
                  color: Colors.grey,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.supportScreen);
                  },
                  child: Ink(
                    padding: EdgeInsets.only(bottom: 8.h, top: 8.h),
                    child: Row(
                      children: [
                        SizedBox(width: 28.w),
                        Image.asset(AppImages.support,
                            height: 20.h, width: 20.h),
                        SizedBox(width: 20.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Support',
                              style: AppTextStyle.interSemiBold
                                  .copyWith(fontSize: 16),
                            ),
                            Text(
                              "We've got Your Back",
                              style: AppTextStyle.interRegular
                                  .copyWith(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h, bottom: 12.h),
                  height: 1 / 2.h,
                  color: Colors.grey,
                ),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state.status == FormsStatus.unauthenticated) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, RouteNames.startScreen, (route) => false);
                    }
                  },
                  child: InkWell(
                    onTap: () {
                      context.read<AuthBloc>().add(LogOutUserEvent());
                    },
                    child: Ink(
                      padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                      child: Row(
                        children: [
                          SizedBox(width: 28.w),
                          Image.asset(AppImages.logout,
                              height: 20.h, width: 20.h),
                          SizedBox(width: 20.w),
                          Text(
                            'Logout',
                            style: AppTextStyle.interSemiBold
                                .copyWith(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
