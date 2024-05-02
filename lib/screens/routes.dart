import 'package:flutter/material.dart';
import 'package:mobile_banking/screens/splash/splash_screen.dart';
import 'package:mobile_banking/screens/splash/start_screen.dart';
import 'package:mobile_banking/screens/tab/tab_screen.dart';
import 'auth/login_screen.dart';
import 'auth/password_reset_screen.dart';
import 'auth/register_screen.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return navigate(const SplashScreen());

      case RouteNames.startRoute:
        return navigate(const StartScreen());

      case RouteNames.tabRoute:
        return navigate(const TabScreen());

      case RouteNames.loginRoute:
        return navigate(const LoginScreen());

      case RouteNames.registerRoute:
        return navigate(const RegisterScreen());

      case RouteNames.passwordReset:
        return navigate(const PasswordResetScreen());



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
  static const String startRoute = "/start_route";
  static const String tabRoute = "/tab_route";
  static const String loginRoute = "/login_route";
  static const String registerRoute = "/register_route";
  static const String passwordReset = "/passwordReset_route";
  static const String profileEdit = "/profileEdit_route";
  static const String addCategory = "/addCategory_route";
  static const String editCategory = "/editCategory_route";
  static const String addProduct = "/addProduct_route";
  static const String editProduct = "/editProduct_route";
  static const String sendNotification = "/sendNotification_route";
}
