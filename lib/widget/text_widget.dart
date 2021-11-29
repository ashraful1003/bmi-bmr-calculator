import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget(this.text,
      {Key? key, this.size, this.weight, this.color, this.space})
      : super(key: key);

  String? text;
  double? size, space;
  FontWeight? weight;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: size ?? 14,
        fontWeight: weight ?? FontWeight.normal,
        letterSpacing: space ?? 0,
      ),
    );
  }
}
