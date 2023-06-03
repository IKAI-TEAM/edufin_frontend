import 'package:edufin/components/rounded_button.dart';
import 'package:edufin/constants.dart';
import 'package:edufin/screens/home/home_screen.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  static String routeName = '/verification';
  const VerificationScreen({
    super.key,
  });

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: getProportionateScreenHeight(45),
                left: getProportionateScreenWidth(10),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(40),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                      width: SizeConfig.screenWidth * 0.2,
                      height: SizeConfig.screenWidth * 0.2,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: SizeConfig.screenWidth * 0.1,
                        height: SizeConfig.screenWidth * 0.1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Icon(
                      Icons.mail_outline_rounded,
                      size: SizeConfig.screenWidth * 0.5,
                      color: kMainColor.withOpacity(0.8),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.04,
                    ),
                    Text(
                      'Verify Your Email',
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: getProportionateScreenHeight(32),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.02,
                    ),
                    Text(
                      "We have just send email verification link on your email. Please check email to verify your Email address.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: getProportionateScreenHeight(16),
                      ),
                    ),
                    RoundedButton(
                      text: 'Next',
                      press: () =>
                          Navigator.pushNamed(context, HomePage.routeName),
                      width: SizeConfig.screenWidth,
                    )
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
