import 'package:crewindemoproject/mainMenu.dart';
import 'package:crewindemoproject/signup_details.dart';
import 'package:crewindemoproject/signup_signin.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../resetPassword.dart';

class Routerr {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const MyApp());
      case '/signinsignup':
        return MaterialPageRoute(builder: (_) => const RegisterAndLogin());
      case '/resetPassword':
        return MaterialPageRoute(builder: (_) => const ResetPassword());
      case '/signUpDetails':
        return MaterialPageRoute(builder: (_) => const SignUpDetails());
         case '/mainMenu':
        return MaterialPageRoute(builder: (_) => const MainMenu());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
