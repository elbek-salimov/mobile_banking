import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_banking/data/models/forms_state.dart';
import 'package:mobile_banking/data/models/network_response.dart';
import 'package:mobile_banking/data/models/user_model.dart';
import 'package:mobile_banking/data/repositories/profile_repository.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.profileRepository)
      : super(ProfileState(
          userModel: UserModel.initial(),
          status: FormsStatus.pure,
          errorMessage: '',
          statusMessage: '',
        )) {
    on<AddUserEvent>(_addUser);
    on<UpdateUserEvent>(_updateUser);
    on<DeleteUserEvent>(_deleteUser);
    on<GetUserByDocIdEvent>(_getUserByDocId);
    on<GetUserByUuidEvent>(_getUserByUuid);
  }

  final ProfileRepository profileRepository;

  _addUser(AddUserEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));

    NetworkResponse networkResponse =
        await profileRepository.addUser(event.userModel);

    if (networkResponse.errorCode.isEmpty) {
      emit(state.copyWith(
          status: FormsStatus.success, userModel: event.userModel));
    } else {
      emit(state.copyWith(
          status: FormsStatus.error, statusMessage: networkResponse.errorCode));
    }
  }

  _updateUser(UpdateUserEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));

    NetworkResponse networkResponse =
        await profileRepository.updateUser(event.userModel);

    if (networkResponse.errorCode.isEmpty) {
      emit(state.copyWith(
          status: FormsStatus.success, userModel: event.userModel));
    } else {
      emit(state.copyWith(
          status: FormsStatus.error, statusMessage: networkResponse.errorCode));
    }
  }

  _deleteUser(DeleteUserEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));

    NetworkResponse networkResponse =
        await profileRepository.deleteUser(event.userModel.userId);

    if (networkResponse.errorCode.isEmpty) {
      emit(state.copyWith(
          status: FormsStatus.success, userModel: UserModel.initial()));
    } else {
      emit(state.copyWith(
          status: FormsStatus.error, statusMessage: networkResponse.errorCode));
    }
  }

  _getUserByDocId(GetUserByDocIdEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));

    NetworkResponse networkResponse =
        await profileRepository.getUserByDocId(event.docId);

    if (networkResponse.errorCode.isEmpty) {
      emit(state.copyWith(
          status: FormsStatus.success,
          userModel: networkResponse.data as UserModel));
    } else {
      emit(state.copyWith(
          status: FormsStatus.error, statusMessage: networkResponse.errorCode));
    }
  }

  _getUserByUuid(GetUserByUuidEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));

    NetworkResponse networkResponse =
        await profileRepository.getUserByUuid(event.uuid);

    if (networkResponse.errorCode.isEmpty) {
      emit(state.copyWith(
          status: FormsStatus.success,
          userModel: networkResponse.data as UserModel));
    } else {
      emit(state.copyWith(
          status: FormsStatus.error, statusMessage: networkResponse.errorCode));
    }
  }
}
