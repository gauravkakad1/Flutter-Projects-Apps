import 'package:flutter/material.dart';
import 'package:login_ui/components/my_button.dart';
import 'package:login_ui/components/my_text_field.dart';
import 'package:login_ui/components/routes_names.dart';
import 'package:login_ui/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/constants.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(

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
                  "Signup",
                  style: TextStyle(
                    fontFamily: mediumfont,
                    fontSize: 24,
                    color: Color(0xff203142),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "Add your details to Signup",
                  style: TextStyle(
                    fontFamily: mediumfont,
                    fontSize: 15,
                    color: Color(0xff203142),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: "Name",
                    hintText: "Name",
                    prefixIcon: const Icon(Icons.person),
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
              const SizedBox(height: 10,),
              TextFormField(
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
              const SizedBox(height: 10,),
              TextFormField(
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
              const SizedBox(height: 10,),
              TextFormField(
                controller: userTypeController,
                decoration: InputDecoration(
                    labelText: "User Type",
                    hintText: "user / owner / admin",
                    prefixIcon: const Icon(Icons.verified_user),
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

              const SizedBox(height: 20,),
              MyButton(title: "Sign up",onPress: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString("signName", nameController.text.toString());
                sp.setString("signEmail", emailController.text.toString());
                sp.setString("signPassword", passwordController.text.toString());
                sp.setString("userType", userTypeController.text.toString());
                // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                Navigator.pushNamed(context, RoutesNames.loginScreen);
              },),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Center(
                    child: Text(
                      "Already have an Account?",
                      style: TextStyle(
                        fontFamily: regularfont,
                        fontSize: 18,
                        color: Color(0xff203142),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsetsDirectional.only(start: 6)),
                  Center(
                    child: InkWell(
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontFamily: mediumfont,
                          fontSize: 18,
                          color: Color(0xffF9703B),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
