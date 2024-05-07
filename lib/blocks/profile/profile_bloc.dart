import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_banking/data/models/forms_state.dart';
import 'package:mobile_banking/data/models/user_model.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc()
      : super(ProfileState(
          userModel: UserModel.initial(),
          status: FormsStatus.pure,
          errorMessage: '',
          statusMessage: '',
        )) {
    on<AddUserEvent>(_addUser);
    on<UpdateUserEvent>(_updateUser);
    on<DeleteUserEvent>(_deleteUser);
    on<GetUserEvent>(_getUser);
  }

  _addUser(AddUserEvent event, emit){}

  _updateUser(UpdateUserEvent event, emit){}

  _deleteUser(DeleteUserEvent event, emit){}

  _getUser(GetUserEvent event, emit){}
}
