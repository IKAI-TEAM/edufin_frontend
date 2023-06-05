import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoCard extends StatelessWidget {
  const NoCard({
    super.key,
    required this.padding,
  });
  final bool padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding
          ? EdgeInsets.only(
              top: getProportionateScreenHeight(10),
              bottom: getProportionateScreenHeight(25),
            )
          : const EdgeInsets.all(0),
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: SizeConfig.screenHeight * 0.28,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenHeight(20)),
            child: Container(
              padding: EdgeInsets.only(
                bottom: getProportionateScreenHeight(20),
                top: getProportionateScreenHeight(15),
                left: getProportionateScreenHeight(30),
                right: getProportionateScreenHeight(30),
              ),
              width: SizeConfig.screenWidth * 0.85,
              height: SizeConfig.screenHeight * 0.28,
              decoration: BoxDecoration(
                color: const Color(0xffB4B4B4).withOpacity(0.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    getProportionateScreenHeight(30),
                  ),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/icons/add.svg',
                        height: getProportionateScreenHeight(30),
                        width: getProportionateScreenHeight(30),
                      ),
                    ),
                    const Text('Add Card'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
