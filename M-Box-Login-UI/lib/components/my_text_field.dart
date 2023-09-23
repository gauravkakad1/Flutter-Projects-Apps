import 'package:flutter/material.dart';

class MyTextfield extends StatefulWidget {
  final String ltext;
  final String htext;
  final IconData? nexticon;

  const MyTextfield({super.key,
    this.nexticon,
    required this.htext,
    required this.ltext,
  });

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {

  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,

      decoration: InputDecoration(
          labelText: widget.ltext,
          hintText: widget.htext,
          prefixIcon: widget.nexticon!=null? Icon(widget.nexticon):null,
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
    );
  }
}
