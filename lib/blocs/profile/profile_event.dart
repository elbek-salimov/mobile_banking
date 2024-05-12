part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class AddUserEvent extends ProfileEvent{
  final UserModel userModel;

  const AddUserEvent({required this.userModel});

  @override
  List<Object?> get props => [userModel];
}

class UpdateUserEvent extends ProfileEvent{
  final UserModel userModel;

  const UpdateUserEvent({required this.userModel});

  @override
  List<Object?> get props => [userModel];
}

class DeleteUserEvent extends ProfileEvent{
  final UserModel userModel;

  const DeleteUserEvent({required this.userModel});

  @override
  List<Object?> get props => [userModel];
}

class GetUserByDocIdEvent extends ProfileEvent{
  final String docId;

  const GetUserByDocIdEvent({required this.docId});

  @override
  List<Object?> get props => [docId];
}

class GetUserByUuidEvent extends ProfileEvent{
  final String uuid;

  const GetUserByUuidEvent(this.uuid);

  @override
  List<Object?> get props => [uuid];
}