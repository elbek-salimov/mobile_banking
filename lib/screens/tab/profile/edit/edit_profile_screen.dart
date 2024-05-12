import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_banking/utils/functions/app_functions.dart';
import 'package:size_util/size_util.dart';

import '../../../../blocs/profile/profile_bloc.dart';
import '../../../../data/models/user_model.dart';
import '../../../../utils/constants/app_constants.dart';
import '../../../../utils/styles/app_text_styles.dart';
import '../../../widgets/global_textfield.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();

  final _formKeyOne = GlobalKey<FormState>();

  late UserModel userModel;

  @override
  void initState() {
    userModel = context.read<ProfileBloc>().state.userModel;
    nameController.text = userModel.userName;
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit',
          style: AppTextStyle.interSemiBold
              .copyWith(color: Colors.green, fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 28.h),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(state.userModel.imageUrl.isEmpty
                        ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'
                        : state.userModel.imageUrl),
                  ),
                ),
                SizedBox(height: 35.h),
                GlobalTextField(
                  formKey: _formKeyOne,
                  validateEmptyText: 'Enter name',
                  validate: AppConstants.textRegExp,
                  validateText: 'Incorrect name',
                  title: 'Name',
                  icon: const Icon(Icons.person, color: Colors.green),
                  controller: nameController,
                ),
                SizedBox(height: 26.h),
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
                      if (isValidateOne) {
                        userModel =
                            userModel.copyWith(userName: nameController.text);
                        context.read<ProfileBloc>().add(
                              UpdateUserEvent(userModel: userModel),
                            );
                        showSnackbar(context, 'Profile updated!');
                      }
                    },
                    child: Text(
                      'Save',
                      style:
                          AppTextStyle.interBold.copyWith(color: Colors.white),
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
