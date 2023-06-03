import 'package:edufin/constants.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';

class MainBackground extends StatelessWidget {
  final Widget child;
  const MainBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      // physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
        height: SizeConfig.screenHeight,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * 0.28,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: kSecondaryGradient,
                    stops: [0, 1],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenHeight(30),
                  ),
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
