import 'package:flutter/material.dart';
import 'package:login_ui/home_page.dart';
import 'package:login_ui/signup_page.dart';
import 'constants.dart';

class MyButton extends StatefulWidget {
  final String title;
  final VoidCallback onPress;
   const MyButton({
    super.key , required this.title, required this.onPress
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color(0xffF9703B),
        ),
        child: Center(
          child: Text(
            widget.title ,
            style: const TextStyle(
                fontFamily: mediumfont,
                fontSize: 20,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
