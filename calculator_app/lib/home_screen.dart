import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'components/my_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var ans = "";
  var userinput = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userinput,
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.centerRight,
                  child: Text(
                    ans,
                    style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            )),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: Row(
                      children: [
                        MyButton(
                          title: "AC",
                          onPress: () {
                            userinput = "";
                            ans = "";
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "+/-",
                          onPress: () {
                            userinput += "+/-";
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "%",
                          onPress: () {
                            userinput += "%";
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "/",
                          bgclr: orangeclr,
                          onPress: () {
                            userinput += "/";
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: Row(
                      children: [
                        MyButton(
                          title: "7",
                          onPress: () {
                            userinput += "7";
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "8",
                          onPress: () {
                            userinput += "8";
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "9",
                          onPress: () {
                            userinput += "9";
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "x",
                          bgclr: orangeclr,
                          onPress: () {
                            userinput += "x";
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: Row(
                      children: [
                        MyButton(
                          title: "4",
                          onPress: () {
                            userinput += "4";
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "5",
                          onPress: () {
                            userinput += "5";
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "6",
                          onPress: () {
                            userinput += "6";
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "-",
                          bgclr: orangeclr,
                          onPress: () {
                            userinput += "-";
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: Row(
                      children: [
                        MyButton(
                          title: "1",
                          onPress: () {
                            userinput += "1";
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "2",
                          onPress: () {
                            userinput += "2";
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "3",
                          onPress: () {
                            userinput += "3";
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "+",
                          bgclr: orangeclr,
                          onPress: () {
                            userinput += "+";
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: Row(
                      children: [
                        MyButton(
                          title: "0",
                          onPress: () {
                            userinput += "0";
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: ".",
                          onPress: () {
                            userinput += ".";
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "DEL",
                          onPress: () {
                            userinput =
                                userinput.substring(0, userinput.length - 1);
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "=",
                          bgclr: orangeclr,
                          onPress: () {
                            try {
                              onEqualPress();
                            } catch (e) {
                              ans = "ERROR";
                            }
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onEqualPress() {
    String finaluserinput = userinput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finaluserinput);
    ContextModel contextmodel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextmodel);
    ans = eval.toString();
  }
}
