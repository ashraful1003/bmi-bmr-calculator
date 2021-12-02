import 'package:bmi_calculator/widget/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Result extends StatefulWidget {
  Result({Key? key, this.weight}) : super(key: key);
  int? weight;

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  bool isBmi = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3 + 6 - 1,
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
                        color: isBmi ? Colors.blue : Colors.transparent,
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
                        color: Colors.black,
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
                        color: !isBmi ? Colors.blue : Colors.transparent,
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
                        color: Colors.black,
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
                      labelOffset: 20,
                      axisLabelStyle: const GaugeTextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                      startAngle: 180,
                      endAngle: 0,
                      ranges: [
                        GaugeRange(
                          startValue: 0,
                          endValue: 100,
                          startWidth: 20,
                          endWidth: 20,
                          gradient: const SweepGradient(colors: [
                            Colors.blue,
                            Colors.blueGrey,
                            Colors.blueAccent
                          ]),
                        ),
                      ],
                      pointers: [
                        RangePointer(
                          value: widget.weight!.toDouble(),
                          width: 20,
                          cornerStyle: CornerStyle.endCurve,
                          enableAnimation: true,
                          gradient: const SweepGradient(colors: [
                            Colors.black45,
                            Colors.black45,
                            Colors.black54,
                            Colors.black54,
                            Colors.black87,
                            Colors.black87,
                            Colors.black,
                          ]),
                        )
                      ],
                      annotations: [
                        GaugeAnnotation(
                          widget: TextWidget(
                            "Current Weight",
                            color: Colors.grey[600],
                            size: 18,
                            weight: FontWeight.bold,
                          ),
                          angle: 270,
                          positionFactor: 0.5,
                        ),
                        GaugeAnnotation(
                          widget: TextWidget(
                            "${widget.weight}",
                            color: Colors.black,
                            size: 38,
                            weight: FontWeight.bold,
                          ),
                          angle: 270,
                          positionFactor: 0.3,
                        ),
                        GaugeAnnotation(
                          widget: Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            height: 25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextWidget(
                              "Your Weight is Normal",
                              color: Colors.green,
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                          ),
                          angle: 270,
                          positionFactor: 0,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 220),
                  child: Column(
                    children: [
                      TextWidget(
                        "Your BMI",
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SfLinearGauge(
                        minimum: 10,
                        maximum: 50,
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
                        markerPointers: const [
                          LinearShapePointer(
                            value: 20,
                            height: 20,
                            width: 20,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
