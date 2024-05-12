part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState({
    required this.userModel,
    required this.status,
    required this.errorMessage,
    required this.statusMessage,
  });

  final UserModel userModel;
  final FormsStatus status;
  final String errorMessage;
  final String statusMessage;

  ProfileState copyWith({
    UserModel? userModel,
    FormsStatus? status,
    String? errorMessage,
    String? statusMessage,
  }) {
    return ProfileState(
      userModel: userModel ?? this.userModel,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }

  @override
  List<Object?> get props => [userModel, status, errorMessage, statusMessage];
}
