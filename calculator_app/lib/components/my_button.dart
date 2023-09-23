import 'package:flutter/material.dart';

const Color whiteclr = Colors.white;
const Color orangeclr = Colors.orange;

class MyButton extends StatelessWidget {
  final String title;
  final Color bgclr;
  final VoidCallback onPress;
  const MyButton(
      {super.key,
      required this.title,
      this.bgclr = const Color(0xffa5a5a5),
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgclr,
            ),
            child: Center(
                child: Text(
              title,
              style: const TextStyle(color: whiteclr, fontSize: 20),
            )),
          ),
        ),
      ),
    );
  }
}
