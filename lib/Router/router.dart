import 'package:crewindemoproject/sportsMenus/mainMenu.dart';
import 'package:crewindemoproject/registerScreens/name.dart';
import 'package:crewindemoproject/registerScreens/signup_details.dart';
import 'package:crewindemoproject/registerScreens/signup_signin.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../registerScreens/resetPassword.dart';
import '../sportsMenus/favoruiteSports.dart';

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
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => SignUpDetails(name: data));
      case '/mainMenu':
        return MaterialPageRoute(builder: (_) => const MainMenu());
      case '/name':
        return MaterialPageRoute(builder: (_) => const Name());
      case '/favourites':
        return MaterialPageRoute(builder: (_) => const FavouriteSports());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
