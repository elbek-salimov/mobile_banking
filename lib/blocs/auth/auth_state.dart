part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String statusMessage;
  final String errorMessage;
  final FormsStatus status;
  final UserModel userModel;

  const AuthState({
    required this.statusMessage,
    required this.errorMessage,
    required this.status,
    required this.userModel,
  });

  AuthState copyWith({
    String? statusMessage,
    String? errorMessage,
    FormsStatus? status,
    UserModel? userModel,
  }) {
    return AuthState(
      statusMessage: statusMessage ?? this.statusMessage,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      userModel: userModel ?? this.userModel,
    );
  }

  @override
  List<Object?> get props => [statusMessage, errorMessage, status, userModel];
}
