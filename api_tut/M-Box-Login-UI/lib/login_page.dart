
import 'package:flutter/material.dart';
import 'package:login_ui/admin_page.dart';
import 'package:login_ui/components/constants.dart';
import 'package:login_ui/components/routes_names.dart';
import 'package:login_ui/owner_page.dart';
import 'package:login_ui/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/my_button.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
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
              height: 30,
            ),
            const Center(
              child: Text(
                "Login",
                style: TextStyle(
                  fontFamily: mediumfont,
                  fontSize: 24,
                  color: Color(0xff203142),
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const Center(
              child: Text(
                "Welcome Back",
                style: TextStyle(
                  fontFamily: mediumfont,
                  fontSize: 24,
                  color: Color(0xff203142),
                ),
              ),
            ),
             Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SizedBox(
                width: 400,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Email",
                      prefixIcon: const Icon(Icons.alternate_email),
                      fillColor: const Color(0xffF8F9FA),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffE4E7EB),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffE4E7EB),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: SizedBox(
                width: 400,
                child: TextFormField(

                  controller: passwordController,
                  decoration: InputDecoration(
                      labelText: "Create Password",
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.lock_open),
                      fillColor: const Color(0xffF8F9FA),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffE4E7EB),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffE4E7EB),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                ),
              ),
            ),
             MyButton(title : "Log in",onPress: () async{
               SharedPreferences sp = await SharedPreferences.getInstance();
               sp.setString("loginEmail", emailController.text.toString());
               sp.setString("loginPassword", passwordController.text.toString());
               sp.setBool("isLogin", true);
               String userType = sp.getString("userType")??"";
               if(userType == "owner"){
                 Navigator.pushNamed(context, RoutesNames.ownerScreen);
               }
               else if(userType == "admin"){
                 Navigator.pushNamed(context, RoutesNames.adminScreen);
               }
               else{
                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                 Navigator.pushNamed(context, RoutesNames.homeScreen , arguments: {
                 "name":"Gaurav","age":21
                 });
               }
             }),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Center(
                  child: Text(
                    "Don't have an Account?",
                    style: TextStyle(
                      fontFamily: regularfont,
                      fontSize: 18,
                      color: Color(0xff203142),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsetsDirectional.only(start: 6)),
                Center(
                  child: InkWell(
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: mediumfont,
                        fontSize: 18,
                        color: Color(0xffF9703B),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, RoutesNames.signUpScreen);
                      },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
