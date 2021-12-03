import 'dart:math';

import 'package:bmi_calculator/model/calculation.dart';
import 'package:bmi_calculator/model/information.dart';
import 'package:bmi_calculator/screen/calculator.dart';
import 'package:bmi_calculator/widget/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Result extends StatefulWidget {
  Result({Key? key, this.calculation}) : super(key: key);
  Calculation? calculation;

  // Information? info;

  //List<String> confi = ["Normal", "Normal1"];

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  bool isBmi = true;
  double? bmi, low, high;

  @override
  Widget build(BuildContext context) {
    bmi = widget.calculation!.weight!.toDouble() /
        pow(widget.calculation!.height!.toDouble() / 100, 2);

    low = 18.5 * pow(widget.calculation!.height!.toDouble() / 100, 2);
    high = 25.0 * pow(widget.calculation!.height!.toDouble() / 100, 2);

    print(information[1]);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF101639),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        title: TextWidget(
          isBmi ? "Your BMI Result" : "Your BMR Result",
          size: 22,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          margin: const EdgeInsets.only(top: 5),
          alignment: Alignment.center,
          color: const Color(0xFF101639),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3 + 5,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.50),
                      blurRadius: 5,
                      spreadRadius: .1,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isBmi = true;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 6,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isBmi
                              ? const Color(0xFF282C4F)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: isBmi
                                  ? Colors.black.withOpacity(.50)
                                  : Colors.transparent,
                              blurRadius: 5,
                              spreadRadius: .1,
                            ),
                          ],
                        ),
                        child: TextWidget(
                          "BMI",
                          color: isBmi ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isBmi = false;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 6,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: !isBmi
                              ? const Color(0xFF282C4F)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: !isBmi
                                  ? Colors.black.withOpacity(.50)
                                  : Colors.transparent,
                              blurRadius: 5,
                              spreadRadius: .1,
                            ),
                          ],
                        ),
                        child: TextWidget(
                          "BMR",
                          color: !isBmi ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  SfRadialGauge(
                    axes: [
                      RadialAxis(
                        minimum: 0,
                        maximum: 100,
                        maximumLabels: 0,
                        labelOffset: 15,
                        labelsPosition: ElementsPosition.outside,
                        axisLabelStyle: const GaugeTextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        startAngle: 180,
                        endAngle: 0,
                        ranges: [
                          GaugeRange(
                            startValue: 0,
                            endValue: 100,
                            startWidth: 20,
                            endWidth: 20,
                            gradient: const SweepGradient(colors: [
                              Color(0xFF282C4F),
                            ]),
                          ),
                        ],
                        pointers: [
                          RangePointer(
                            value: widget.calculation!.weight!.toDouble(),
                            width: 20,
                            cornerStyle: CornerStyle.endCurve,
                            enableAnimation: true,
                            gradient: SweepGradient(colors: [
                              const Color(0xBEFF0067).withOpacity(0.1),
                              const Color(0xBEFF0067).withOpacity(0.4),
                              const Color(0xBEFF0067).withOpacity(0.7),
                              const Color(0xBEFF0067),
                            ]),
                          )
                        ],
                        annotations: [
                          GaugeAnnotation(
                            widget: TextWidget(
                              "Current Weight",
                              color: Colors.white,
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                            angle: 270,
                            positionFactor: 0.5,
                          ),
                          GaugeAnnotation(
                            widget: TextWidget(
                              "${widget.calculation!.weight}",
                              color: const Color(0xBEFF0067),
                              size: 70,
                              weight: FontWeight.bold,
                            ),
                            angle: 270,
                            positionFactor: 0.25,
                          ),
                          GaugeAnnotation(
                            widget: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              height: 25,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TextWidget(
                                "Your Weight is " +
                                    (bmi! < 18.5
                                        ? condition[0].toString()
                                        : bmi! < 25
                                            ? condition[1].toString()
                                            : bmi! < 30
                                                ? condition[2].toString()
                                                : condition[3].toString()),
                                color: Colors.green,
                                size: 18,
                                weight: FontWeight.bold,
                              ),
                            ),
                            angle: 270,
                            verticalAlignment: GaugeAlignment.near,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 220, 20, 0),
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF282C4F),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.2),
                          blurRadius: 5.0,
                          offset: const Offset(3.0, 3.0),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        TextWidget(
                          isBmi ? "Your BMI is" : "Your BMR is",
                          color: Colors.white.withOpacity(0.7),
                          size: 24,
                        ),
                        TextWidget(
                          bmi!.toStringAsFixed(2),
                          color: bmi! < 18.5
                              ? Colors.blue
                              : bmi! < 25
                                  ? Colors.green
                                  : bmi! < 30
                                      ? Colors.yellow
                                      : bmi! < 35
                                          ? Colors.orange
                                          : bmi! < 40
                                              ? Colors.red
                                              : Colors.purple,
                          size: 40,
                        ),
                        TextWidget(
                          "kg/m2",
                          color: Colors.white.withOpacity(0.7),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SfLinearGauge(
                          minimum: 10,
                          maximum: 50,
                          axisLabelStyle: const TextStyle(color: Colors.white),
                          showAxisTrack: false,
                          ranges: const <LinearGaugeRange>[
                            LinearGaugeRange(
                              startValue: 10,
                              endValue: 18.5,
                              startWidth: 20,
                              endWidth: 20,
                              color: Colors.blue,
                            ),
                            LinearGaugeRange(
                              startValue: 18.5,
                              endValue: 25,
                              startWidth: 20,
                              endWidth: 20,
                              color: Colors.green,
                            ),
                            LinearGaugeRange(
                              startValue: 25,
                              endValue: 30,
                              startWidth: 20,
                              endWidth: 20,
                              color: Colors.yellow,
                            ),
                            LinearGaugeRange(
                              startValue: 30,
                              endValue: 35,
                              startWidth: 20,
                              endWidth: 20,
                              color: Colors.orange,
                            ),
                            LinearGaugeRange(
                              startValue: 35,
                              endValue: 40,
                              startWidth: 20,
                              endWidth: 20,
                              color: Colors.red,
                            ),
                            LinearGaugeRange(
                              startValue: 40,
                              endValue: 50,
                              startWidth: 20,
                              endWidth: 20,
                              color: Colors.purple,
                            ),
                          ],
                          markerPointers: [
                            LinearShapePointer(
                              value: bmi!.toDouble(),
                              height: 20,
                              width: 20,
                              color: const Color(0xFF101639),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                              isBmi
                                  ? "Your BMI is considered "
                                  : "Your BMR is considered ",
                              color: Colors.white.withOpacity(0.7),
                            ),
                            TextWidget(
                              bmi! < 18.5
                                  ? condition[0].toString()
                                  : bmi! < 25
                                      ? condition[1].toString()
                                      : bmi! < 30
                                          ? condition[2].toString()
                                          : condition[3].toString(),
                              color: bmi! < 18.5
                                  ? Colors.blue
                                  : bmi! < 25
                                      ? Colors.green
                                      : bmi! < 30
                                          ? Colors.yellow
                                          : bmi! < 35
                                              ? Colors.orange
                                              : bmi! < 40
                                                  ? Colors.red
                                                  : Colors.purple,
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextWidget(
                          bmi! < 18.5
                              ? info[0].toString()
                              : bmi! < 25
                                  ? info[1].toString()
                                  : bmi! < 30
                                      ? info[2].toString()
                                      : info[3].toString(),
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget("Healthy BMI range: 18.5 kg/m2 - 25 kg/m2"),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                  "Healthy weight for the height: ${low!.toStringAsFixed(0)} kgs - ${high!.toStringAsFixed(0)} kgs"),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Calculator()));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 14,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xBEFF0067),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.replay,
                color: Colors.white,
                size: 28,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextWidget(
                  "Re-Calculate",
                  size: 24,
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
