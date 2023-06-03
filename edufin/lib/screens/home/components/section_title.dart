import 'package:edufin/constants.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.text,
    required this.press,
    required this.tap,
  });
  final bool tap;
  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              fontWeight: FontWeight.bold,
            ),
          ),
          tap
              ? GestureDetector(
                  onTap: press,
                  child: Text(
                    "See More",
                    style: TextStyle(
                      color: kMainColor,
                      fontSize: getProportionateScreenWidth(14),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
