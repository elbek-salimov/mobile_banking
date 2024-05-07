import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_banking/data/models/forms_state.dart';
import 'package:mobile_banking/data/models/network_response.dart';
import 'package:mobile_banking/data/models/user_model.dart';
import 'package:mobile_banking/data/repositories/auht_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository})
      : super(AuthState(
          statusMessage: '',
          errorMessage: '',
          status: FormsStatus.pure,
          userModel: UserModel.initial(),
        )) {
    on<CheckAuthenticationEvent>(_checkAuthentication);
    on<LoginUserEvent>(_loginUser);
    on<RegisterUserEvent>(_registerUser);
    on<LogOutUserEvent>(_logOutUser);
    on<SignInWithGoogleEvent>(_signInWithGoogle);
  }

  final AuthRepository authRepository;

  _checkAuthentication(CheckAuthenticationEvent event, emit) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      emit(state.copyWith(status: FormsStatus.unauthenticated));
    } else {
      emit(state.copyWith(status: FormsStatus.authenticated));
    }
  }

  _loginUser(LoginUserEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    NetworkResponse networkResponse =
        await authRepository.loginWithEmailAndPassword(
      email: event.email,
      password: event.password,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(status: FormsStatus.authenticated));
    } else {
      emit(state.copyWith(
          status: FormsStatus.error, errorMessage: networkResponse.errorText));
    }
  }

  _registerUser(RegisterUserEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    NetworkResponse networkResponse =
        await authRepository.registerWithEmailAndPassword(
      email: event.userModel.email,
      password: event.userModel.password,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(
          status: FormsStatus.authenticated, statusMessage: 'registered'));
    } else {
      emit(state.copyWith(
          status: FormsStatus.error, errorMessage: networkResponse.errorText));
    }
  }

  _logOutUser(LogOutUserEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    NetworkResponse networkResponse = await authRepository.logOutUser();

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(status: FormsStatus.unauthenticated));
    } else {
      emit(state.copyWith(
          status: FormsStatus.error, errorMessage: networkResponse.errorText));
    }
  }

  _signInWithGoogle(SignInWithGoogleEvent event, emit) async {
    emit(state.copyWith(status: FormsStatus.loading));
    NetworkResponse networkResponse = await authRepository.googleSignIn();

    if (networkResponse.errorText.isEmpty) {
      UserCredential userCredential = networkResponse.data;
      emit(
        state.copyWith(
          statusMessage: 'registered',
          status: FormsStatus.authenticated,
          userModel: UserModel(
            userName: userCredential.user!.displayName ?? '',
            email: userCredential.user!.email ?? '',
            password: '',
            imageUrl: userCredential.user!.photoURL ?? '',
            userId: '',
            fcm: '',
            uuid: userCredential.user!.uid,
          ),
        ),
      );
    } else {
      emit(state.copyWith(
          status: FormsStatus.error, errorMessage: networkResponse.errorText));
    }
  }
}
