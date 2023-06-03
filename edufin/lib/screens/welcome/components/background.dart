import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
        height: SizeConfig.screenHeight,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_left.png",
                width: SizeConfig.screenWidth * 0.8,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                "assets/images/main_right.png",
                width: SizeConfig.screenHeight * 0.4,
              ),
            ),
            Positioned(
              bottom: 0,
              right: -25,
              child: Image.asset(
                "assets/images/splash_icon.png",
                width: SizeConfig.screenWidth * 1.3,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
