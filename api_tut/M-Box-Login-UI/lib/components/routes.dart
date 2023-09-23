import 'package:flutter/material.dart';
import 'package:login_ui/admin_page.dart';
import 'package:login_ui/home_page.dart';
import 'package:login_ui/login_page.dart';
import 'package:login_ui/owner_page.dart';
import 'package:login_ui/splash_page.dart';
import '../signup_page.dart';
import 'routes_names.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesNames.homeScreen:
        return MaterialPageRoute(builder: (context)=> HomePage(data: settings.arguments as Map,));
      case RoutesNames.signUpScreen:
        return MaterialPageRoute(builder: (context)=>const SignupPage());
      case RoutesNames.loginScreen:
        return MaterialPageRoute(builder: (context)=>const LoginPage());
      case RoutesNames.ownerScreen:
        return MaterialPageRoute(builder: (context)=>const OwnerPage());
      case RoutesNames.adminScreen:
        return MaterialPageRoute(builder: (context)=>const AdminPage());
      case RoutesNames.splashScreen:
        return MaterialPageRoute(builder: (context)=>const SplashPage());
      default :
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
            body: Center(child: Text("No Route Present"),),
          );
        });
    }
  }
}