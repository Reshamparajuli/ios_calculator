// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator_Ui extends StatefulWidget {
  const Calculator_Ui({Key? key}) : super(key: key);

  @override
  State<Calculator_Ui> createState() => _Calculator_UiState();
}

class _Calculator_UiState extends State<Calculator_Ui> {
  double firstnumber = 0;
  double secondnumber = 0;
  String outputdisplay = "0";
  String result = "";
  String finalresult = "";
  String operator = "";
  String preoperator = "";
  void buttonClicked(String button_value) {
    if (button_value == "AC") {
      firstnumber = 0;
      secondnumber = 0;
      outputdisplay = "0";
      result = "0";
      finalresult = "0";
      operator = "";
    } else if (button_value == "+" ||
        button_value == "-" ||
        button_value == "x" ||
        button_value == "/") {
      firstnumber = double.parse(outputdisplay);
      result = "";

      operator = button_value;
    } else if (button_value == "=") {
      if (outputdisplay.isNotEmpty) {
        secondnumber = double.parse(outputdisplay);
        if (operator == "+") {
          finalresult = add();
        }
        if (operator == "-") {
          finalresult = sub();
        }
        if (operator == "x") {
          finalresult = mul();
        }
        if (operator == "/") {
          finalresult = div();
        } else if (outputdisplay == "0") {
          result = outputdisplay;
          finalresult = result;
        }
      }
    } else if (button_value == "+/-") {
      result.toString().startsWith("-")
          ? result = result.toString().substring(1)
          : result = "-" + result.toString();
      finalresult = result;
    } else if (button_value == "%") {
      result = (firstnumber / 100) as String;

      finalresult = doesdecimalvalue(result);
      // } else if (button_value == ".") {
      //   if (!result.toString().contains(".")) {
      //     result = result;
      //   }
      //   finalresult = result;
    } else {
      result = int.parse(result + button_value).toString();
      finalresult = result;
    }

    setState(() {
      outputdisplay = finalresult;
    });
  }

  String add() {
    result = (firstnumber + secondnumber).toString();
    firstnumber = double.parse(result);
    return doesdecimalvalue(result);
  }

  String sub() {
    result = (firstnumber - secondnumber).toString();
    firstnumber = double.parse(result);
    return doesdecimalvalue(result);
  }

  String mul() {
    result = (firstnumber * secondnumber).toString();
    firstnumber = double.parse(result);
    return doesdecimalvalue(result);
  }

  String div() {
    result = (firstnumber / secondnumber).toString();
    firstnumber = double.parse(result);
    return doesdecimalvalue(result);
  }

  Widget button(String button_value, Color button_color, Color text_color) {
    return GestureDetector(
      onTap: () {
        buttonClicked(button_value);
      },
      child: CircleAvatar(
        backgroundColor: button_color,
        radius: 40,
        child: Text(
          button_value,
          style: TextStyle(fontSize: 40, color: text_color),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25, left: 25),
                      child: Text(
                        outputdisplay,
                        style: TextStyle(fontSize: 60, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("AC", Colors.grey, Colors.black),
                button("+/-", Colors.grey, Colors.black),
                button("%", Colors.grey, Colors.black),
                button("/", Colors.amber.shade800, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("7", Colors.grey.shade900, Colors.white),
                button("8", Colors.grey.shade900, Colors.white),
                button("9", Colors.grey.shade900, Colors.white),
                button("x", Colors.amber.shade800, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("4", Colors.grey.shade900, Colors.white),
                button("5", Colors.grey.shade900, Colors.white),
                button("6", Colors.grey.shade900, Colors.white),
                button("-", Colors.amber.shade800, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("1", Colors.grey.shade900, Colors.white),
                button("2", Colors.grey.shade900, Colors.white),
                button("3", Colors.grey.shade900, Colors.white),
                button("+", Colors.amber.shade800, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => buttonClicked("0"),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(34, 20, 128, 20),
                    child: const Text("0",
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                    decoration: const ShapeDecoration(
                        color: Colors.grey,
                        shape: const StadiumBorder(
                          side: BorderSide.none,
                        )),
                  ),
                ),
                button(".", Colors.grey.shade900, Colors.white),
                button("=", Colors.amber.shade800, Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  String doesdecimalvalue(dynamic result) {
    return result;
  }
}
