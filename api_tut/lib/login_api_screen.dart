import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class LoginApiScreen extends StatefulWidget {
  const LoginApiScreen({super.key});

  @override
  State<LoginApiScreen> createState() => _LoginApiScreenState();
}

class _LoginApiScreenState extends State<LoginApiScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void isLogin(String email, password) async {
    try{
      Response response  = await post(Uri.parse('https://reqres.in/api/login') ,
          body: {
            "email" : email,
            "password" : password
          }
      );
      if(response.statusCode ==200){
        print("Login successful");
        var data = jsonDecode(response.body.toString());
        print(data["token"].toString());
      }else{
        print("Failed");
      }
    }
    catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email"
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password"
                ),
              ),
              SizedBox(height: 20,),

              GestureDetector(
                onTap: (){
                  isLogin(emailController.text.toString(),passwordController.text.toString());
                },
                child: Container(
                  height: 50,
                  child: Center(child: Text("Login" , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlue
                ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
