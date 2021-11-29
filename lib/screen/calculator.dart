import 'package:bmi_calculator/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int weight = 60, age = 21;
  double heightPerson = 175.0;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 4.3;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF101639),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.sort,
          ),
        ),
        title: TextWidget(
          "BMI Calculator",
          color: Colors.white,
          size: 18,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        decoration: const BoxDecoration(
          color: Color(0xFF101639),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 15, 15, 5),
              child: TextWidget(
                "Gender",
                color: Colors.white,
                size: 12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      height: height,
                      width: MediaQuery.of(context).size.width / 2 - 22,
                      decoration: BoxDecoration(
                        color: const Color(0xFF282C4F),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isMale
                              ? const Color(0xFFFF0067)
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: isMale
                                        ? const Color(0xFFFF0067)
                                        : Colors.black38,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                )),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.male,
                                  color: Colors.white,
                                  size: 120,
                                ),
                                TextWidget(
                                  "Male",
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      height: height,
                      width: MediaQuery.of(context).size.width / 2 - 22,
                      decoration: BoxDecoration(
                        color: const Color(0xFF282C4F),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: !isMale
                              ? const Color(0xFFFF0067)
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: !isMale
                                        ? const Color(0xFFFF0067)
                                        : Colors.black38,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                )),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.female,
                                  color: Colors.white,
                                  size: 120,
                                ),
                                TextWidget(
                                  "Female",
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Container(
                height: height,
                width: MediaQuery.of(context).size.width - 22,
                decoration: BoxDecoration(
                  color: const Color(0xFF282C4F),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      "HEIGHT",
                      color: Colors.white,
                      size: 20,
                      weight: FontWeight.bold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        TextWidget(
                          heightPerson.toStringAsFixed(2),
                          color: Colors.white,
                          size: 60,
                          weight: FontWeight.bold,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextWidget(
                          "CM",
                          color: Colors.white,
                          size: 14,
                        ),
                      ],
                    ),
                    Slider(
                      activeColor: Colors.white,
                      inactiveColor: Colors.white,
                      thumbColor: const Color(0xFFFF0067),
                      min: 40,
                      max: 275,
                      value: heightPerson,
                      onChanged: (value) {
                        setState(() {
                          heightPerson = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 15, 15, 0),
              child: Row(
                children: [
                  Container(
                    height: height,
                    width: MediaQuery.of(context).size.width / 2 - 22,
                    decoration: BoxDecoration(
                      color: const Color(0xFF282C4F),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          "WEIGHT",
                          color: Colors.white,
                          size: 20,
                          weight: FontWeight.bold,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            TextWidget(
                              "$weight",
                              color: Colors.white,
                              size: 60,
                              weight: FontWeight.bold,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextWidget(
                              "KG",
                              color: Colors.white,
                              size: 14,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(20),
                                primary: const Color(0xFF212747),
                                onPrimary: const Color(0xFF212779),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(20),
                                primary: const Color(0xFF212747),
                                onPrimary: const Color(0xFF212779),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height,
                    width: MediaQuery.of(context).size.width / 2 - 22,
                    margin: const EdgeInsets.only(left: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF282C4F),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          "AGE",
                          color: Colors.white,
                          size: 20,
                          weight: FontWeight.bold,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            TextWidget(
                              "$age",
                              color: Colors.white,
                              size: 60,
                              weight: FontWeight.bold,
                            ),
                            TextWidget(
                              "YEARS",
                              color: Colors.white,
                              size: 14,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(20),
                                primary: const Color(0xFF212747),
                                onPrimary: const Color(0xFF212779),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: const Icon(Icons.add, color: Colors.white),
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(20),
                                primary: const Color(0xFF212747),
                                onPrimary: const Color(0xFF212779),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {

              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 14,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF0067),
                ),
                child: TextWidget(
                  "Calculate",
                  color: Colors.white,
                  size: 24,
                  weight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
