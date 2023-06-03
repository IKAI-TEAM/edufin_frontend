import 'package:edufin/constants.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function() press;
  final Color color, textColor;
  final double width;
  final double padding;
  const RoundedButton({
    super.key,
    required this.text,
    required this.press,
    this.color = kMainColor,
    this.textColor = Colors.white,
    this.padding = 20,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: padding),
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(getProportionateScreenHeight(10)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 40,
            ),
            backgroundColor: color,
          ),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
