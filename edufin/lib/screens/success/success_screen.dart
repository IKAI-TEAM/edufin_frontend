import 'package:edufin/constants.dart';
import 'package:edufin/screens/home/home_screen.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';
import '../../components/rounded_button.dart';

class SuccessScreen extends StatelessWidget {
  static String routeName = '/success';
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      "assets/images/sukses.png",
                      width: SizeConfig.screenWidth * 0.9,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.05,
                    ),
                    Text(
                      "Login Success!",
                      style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(34),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.02,
                    ),
                    Text(
                      "Your login process has been successful, you can continue to the main page",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: getProportionateScreenHeight(14),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.1,
                    ),
                    RoundedButton(
                      width: SizeConfig.screenWidth * 0.8,
                      text: 'Continue to Home Page',
                      press: () {
                        Navigator.pushNamed(
                          context,
                          HomePage.routeName,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
