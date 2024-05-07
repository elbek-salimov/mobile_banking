class SignWithEmailAndPasswordFailure implements Exception {
  final String message;

  const SignWithEmailAndPasswordFailure([
    this.message = "An unknown exception occurred.",
  ]);

  factory SignWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignWithEmailAndPasswordFailure(
          "Email is not valid or badly formatted.",
        );
      case 'user-disabled':
        return const SignWithEmailAndPasswordFailure(
          "This user has been disabled. Please contact support for help.",
        );
      case 'email-already-in-use':
        return const SignWithEmailAndPasswordFailure(
          "An account already exists fot that email.",
        );
      case 'operation-not-allowed':
        return const SignWithEmailAndPasswordFailure(
          "Operation is not allowed. Please contact support.",
        );
      case 'weak-password':
        return const SignWithEmailAndPasswordFailure(
          "Please enter a stronger password.",
        );
      default:
        return const SignWithEmailAndPasswordFailure();
    }
  }
}

class LoginWithEmailAndPasswordFailure implements Exception {
  final String message;

  const LoginWithEmailAndPasswordFailure([
    this.message = "An unknown exception occurred.",
  ]);

  factory LoginWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LoginWithEmailAndPasswordFailure(
          "Email is not valid or badly formatted.",
        );
      case 'user-disabled':
        return const LoginWithEmailAndPasswordFailure(
          "This user has been disabled. Please contact support for help.",
        );
      case 'user-not-found':
        return const LoginWithEmailAndPasswordFailure(
          "Email is not found, please contact support for help.",
        );
      case 'wrong-password':
        return const LoginWithEmailAndPasswordFailure(
          "Incorrect password, please try again.",
        );
      case 'invalid-credential':
        return const LoginWithEmailAndPasswordFailure(
          "User not found!.",
        );
      default:
        return LoginWithEmailAndPasswordFailure(code);
    }
  }
}

class LoginWithGoogleFailure implements Exception {
  final String message;

  const LoginWithGoogleFailure([
    this.message = "An unknown exception occurred.",
  ]);

  factory LoginWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LoginWithGoogleFailure(
          "Account exists with different credentials.",
        );
      case 'invalid-credential':
        return const LoginWithGoogleFailure(
          "The credential received is malformed or has expired.",
        );
      case 'operation-not-allowed':
        return const LoginWithGoogleFailure(
          "Operation is not allowed. Please contact support.",
        );
      case 'user-disabled':
        return const LoginWithGoogleFailure(
          "This user has been disabled. Please contact support for help.",
        );
      case 'user-not-found':
        return const LoginWithGoogleFailure(
          "Email is not found, please create an account.",
        );
      case 'wrong-password':
        return const LoginWithGoogleFailure(
          "Incorrect password, please try again.",
        );
      case 'invalid-verification-code':
        return const LoginWithGoogleFailure(
          "The credential verification code received is invalid.",
        );
      case 'invalid-verification-id':
        return const LoginWithGoogleFailure(
          "The credential verification ID received is invalid.",
        );
      default:
        return const LoginWithGoogleFailure();
    }
  }
}

class LogOutFailure implements Exception {}
