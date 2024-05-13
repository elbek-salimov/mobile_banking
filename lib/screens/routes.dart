import 'package:flutter/material.dart';
import 'package:mobile_banking/screens/splash/splash_screen.dart';
import 'package:mobile_banking/screens/splash/start_screen.dart';
import 'package:mobile_banking/screens/tab/cards/add_card/add_card_screen.dart';
import 'package:mobile_banking/screens/tab/pay/pay_screen.dart';
import 'package:mobile_banking/screens/tab/profile/edit/edit_profile_screen.dart';
import 'package:mobile_banking/screens/tab/profile/notification/notification_screen.dart';
import 'package:mobile_banking/screens/tab/profile/support/support_screen.dart';
import 'package:mobile_banking/screens/tab/profile/theme/theme_screen.dart';
import 'package:mobile_banking/screens/tab/profile/verification/kyc_verification_screen.dart';
import 'package:mobile_banking/screens/tab/tab_screen.dart';
import 'auth/login_screen.dart';
import 'auth/password_reset_screen.dart';
import 'auth/register_screen.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return navigate(const SplashScreen());

      case RouteNames.startScreen:
        return navigate(const StartScreen());

      case RouteNames.tabRoute:
        return navigate(const TabScreen());

      case RouteNames.loginScreen:
        return navigate(const LoginScreen());

      case RouteNames.registerScreen:
        return navigate(const RegisterScreen());

      case RouteNames.passwordResetScreen:
        return navigate(const PasswordResetScreen());

      case RouteNames.profileEditScreen:
        return navigate(const EditProfileScreen());

      case RouteNames.themeScreen:
        return navigate(const ThemeScreen());

      case RouteNames.notificationScreen:
        return navigate(const NotificationScreen());

      case RouteNames.supportScreen:
        return navigate(const SupportScreen());

      case RouteNames.kycVerificationScreen:
        return navigate(const KycVerificationScreen());

      case RouteNames.payScreen:
        return navigate(const PayScreen());

      case RouteNames.addCardScreen:
        return navigate(const AddCardScreen());

      // case RouteNames.editProduct:
      //   Map<String, dynamic> map = settings.arguments as Map<String, dynamic>;
      //   return navigate(EditProductScreen(
      //     productName: map['productName'] as String,
      //     productPrice: map['productPrice'] as double,
      //     productDescription: map['productDescription'] as String,
      //     imageAddress: map['imageAddress'] as String,
      //     docId: map['docId'] as String,
      //     categoryName: map['categoryName'] as String,
      //   ));

      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text("This kind of rout does not exist!"),
            ),
          ),
        );
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

class RouteNames {
  static const String splashScreen = "/";
  static const String startScreen = "/start_route";
  static const String tabRoute = "/tab_route";
  static const String loginScreen = "/login_route";
  static const String registerScreen = "/register_route";
  static const String passwordResetScreen = "/passwordReset_route";
  static const String profileEditScreen = "/profileEdit_route";
  static const String addCategoryScreen = "/addCategory_route";
  static const String editCategoryScreen = "/editCategory_route";
  static const String addProductScreen = "/addProduct_route";
  static const String editProductScreen = "/editProduct_route";
  static const String sendNotificationScreen = "/notification_route";
  static const String themeScreen = "/theme_route";
  static const String notificationScreen = "/notification_route";
  static const String supportScreen = "/support_route";
  static const String kycVerificationScreen = "/kycVerification_route";
  static const String payScreen = "/pay_route";
  static const String addCardScreen = "/addCard_route";
}
