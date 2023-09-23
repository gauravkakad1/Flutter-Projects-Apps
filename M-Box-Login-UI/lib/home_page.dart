import 'package:flutter/material.dart';
import 'package:login_ui/components/constants.dart';
import 'package:login_ui/components/my_button.dart';
import 'package:login_ui/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/routes_names.dart';
class HomePage extends StatefulWidget {
  dynamic data;

  HomePage({super.key,required this.data});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "";
  String email = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

  }
  void getData()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    email  = sp.getString("loginEmail")??"";
    name  = sp.getString("signName")??"";
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title : const Center(child: Text("HomeScreen")),
        backgroundColor: orangeclr,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("  Hi  " + widget.data["name"].toString() ,
          style: TextStyle(
            fontFamily: mediumfont,
            fontSize: 30
          ),
          ),
          const SizedBox(height: 10),
          Text("  Age  " + widget.data["age"].toString() ,
          style: TextStyle(
            fontFamily: mediumfont,
            fontSize: 30
          ),

          ),
          const SizedBox(height: 50),
           Text("Welcome  " + name ,
          style: TextStyle(
            fontFamily: regularfont,
            fontSize: 30
          ),

          ),

          Text("Email  :  " + email ,
            style: const TextStyle(
                fontFamily: regularfont,
                fontSize: 30
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: MyButton(title: "Logout", onPress: () async{
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.clear();
              Navigator.pushNamed(context, RoutesNames.loginScreen);
            }),
          )
        ],
      ),

    );
  }
}
