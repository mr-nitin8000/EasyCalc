import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'DescPage.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFF292D29)),
      debugShowCheckedModeBanner: false,
      title: "EasyCalc",
      home: Scaffold(
        body: CalculatorApp(),
      ),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  int count = 0;
  var result = '';
  var inputUser = '';
  var show = '';

  void buttonPressed(String text) {
    setState(() {
      inputUser = inputUser + text;
      show = inputUser.replaceAll('*', 'x');
      show = show.replaceAll('x(0.01)', '%');
      show = show.replaceAll('/', '÷');
      // print(show);
    });
  }

  bool isOprator(String text) {
    var list = ['AC', '()', '%'];

    for (var item in list) {
      if (text == item) {
        return true;
      }
    }
    return false;
  }

  Color getBackgroundColor(String text) {
    if (isOprator(text)) {
      return Color(0xFFFC650E);
    } else {
      return Color(0xFFB4ACAC);
    }
  }

  bool TextOprator(String text) {
    var list = ['AC', '()', '%'];

    for (var item in list) {
      if (text == item) {
        return true;
      }
    }
    return false;
  }

  Color getTextColor(String text) {
    if (isOprator(text)) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  Widget getRowWidget(String text1, String text2, String text3, String text4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(
          onPressed: () {
            if (text1 == 'AC') {
              setState(() {
                inputUser = '';
                result = '0';
                show = ' ';
              });
            } else {
              buttonPressed(text1);
            }
          },
          elevation: 2.0,
          fillColor: getBackgroundColor(text1),
          child: Text(
            text1,
            style: TextStyle(
              color: getTextColor(text1),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          padding: EdgeInsets.all(20),
          shape: CircleBorder(),
        ),
        RawMaterialButton(
          onPressed: () {
            if (text2 == "()" && count == 0) {
              count++;
              text2 = "*(";
            } else if (text2 == "()" && count == 1) {
              count = 0;
              text2 = ")";
            }
            buttonPressed(text2);
          },
          elevation: 2.0,
          fillColor: getBackgroundColor(text2),
          child: Text(
            text2,
            style: TextStyle(
              color: getTextColor(text2),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          padding: EdgeInsets.all(20),

          shape: CircleBorder(),
        ),
        RawMaterialButton(
          onPressed: () {
            if (text3 == "%") {
              text3 = "*(0.01)";
            }
            buttonPressed(text3);
          },
          elevation: 2.0,
          fillColor: getBackgroundColor(text3),
          child: Text(
            text3,
            style: TextStyle(
              color: getTextColor(text3),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          padding: EdgeInsets.all(20),
          shape: CircleBorder(),
        ),
        RawMaterialButton(
          onPressed: () {
            if (text4 == 'x') {
              text4 = '*';
              buttonPressed(text4);
            } else if (text4 == '÷') {
              text4 = '/';
              buttonPressed(text4);
            } else if (text4 == '=') {
              try {
                Parser parser = Parser();
                Expression expression = parser.parse(inputUser);
                ContextModel contextModel = ContextModel();
                double eval =
                    expression.evaluate(EvaluationType.REAL, contextModel);
                eval = double.parse((eval).toStringAsFixed(2));
                // print(eval);
                setState(() {
                  result = eval.toString();
                  inputUser = " ";
                  show = " ";
                });
              } catch (e) {
                setState(() {
                  result = "Expression Error";
                });
              }
            } else {
              buttonPressed(text4);
            }
          },
          elevation: 2.0,
          fillColor: Colors.green,
          child: Text(
            text4,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          padding: EdgeInsets.all(15),
          shape: CircleBorder(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xFF363D3A),
        title: Text(
          "EasyCalc",
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  backgroundColor: Color(0xFFC9D7DE),
                  icon: Image.asset(
                    'img/alert.png',
                    height: 40,
                  ),
                  title: Text('About EasyCalc'),
                  content: Text("App Name: EasyCalc\n\n"
                      "Developer: Nitin Kumawat\n\n"
                      "Developed Date: Aug 27, 2023\n\n"
                      "Description:\n"
                      "EasyCalc is the ultimate tool for quick and accurate calculations. Developed by Nitin Kumawat, this simple calculator app is designed to streamline your everyday math needs. Whether you're a student, professional, or anyone in between, EasyCalc makes math effortless. Download now and simplify your calculations with ease."
                      "\n\nVersion: 1.0.0"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DescApp())),
                      child: const Text('More Info'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(
              Icons.info_outline,
              size: 18,
            ),
          ),
        ],
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('img/calc.gif'),
                  // image: AssetImage('img/cl.gif'),
                  fit: BoxFit.fitWidth)),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            // "$inputUser",
                            "$show",
                            style: TextStyle(color: Colors.red, fontSize: 30),
                            textAlign: TextAlign.right,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            " ",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "$result",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors
                        .grey, // Change this color to your desired border color
                    width: 0.8, // Change the width as needed
                  ),
                  bottom: BorderSide(
                    color: Colors
                        .grey, // Change this color to your desired border color
                    width: 0.8, // Change the width as needed
                  ),
                ),
              ),
              padding: EdgeInsets.only(top: 3, bottom: 3, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        if (inputUser.length > 0) {
                          inputUser =
                              inputUser.substring(0, inputUser.length - 1);
                          show =
                              show.substring(0, show.length - 1);
                        }
                      });
                    },
                    elevation: 2.0,
                    fillColor: Colors.black,
                    child: Text(
                      "◀",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    shape: CircleBorder(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Expanded(
              flex: 68,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('img/cl.gif'), fit: BoxFit.fitWidth)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    getRowWidget('AC', '()', '%', '÷'),
                    getRowWidget('1', '2', '3', 'x'),
                    getRowWidget('4', '5', '6', '-'),
                    getRowWidget('7', '8', '9', '+'),
                    getRowWidget('00', '0', '.', '='),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
