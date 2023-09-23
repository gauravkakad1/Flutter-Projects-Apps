import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_ui/components/routes_names.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/constants.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState(){
    super.initState();
    isLogin();
  }
  void isLogin() async{

    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool("isLogin")??false;
    String userType = sp.getString("userType")??"";
    if(isLogin){
      if(userType == "owner"){
        Timer(Duration(seconds: 3), () {
          Navigator.pushNamed(context, RoutesNames.ownerScreen);
        });
      }
      else if(userType == "admin"){
        Timer(Duration(seconds: 3), () {
          Navigator.pushNamed(context, RoutesNames.adminScreen);
        });
      }
      else{
        Timer(Duration(seconds: 3), () {
          Navigator.pushNamed(context, RoutesNames.homeScreen,arguments: {
            "name":"Rahul","age":22
          });
        });
      }
    }
    else{
      Timer(Duration(seconds: 3), () {
        Navigator.pushNamed(context, RoutesNames.loginScreen);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  height: 50,
                  width: 50,
                  image: AssetImage("images/logo.png"),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Center(
                      child: Text(
                        "Maintenance",
                        style: TextStyle(
                          fontFamily: mediumfont,
                          fontSize: 24,
                          color: Color(0xffF9703D),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Box",
                        style: TextStyle(
                          fontFamily: mediumfont,
                          fontSize: 24,
                          color: Color(0xff203142),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
