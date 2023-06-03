import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:edufin/screens/welcome/components/background.dart';
import '../../../components/rounded_button.dart';
import '../../login/login_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.1,
            ),
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
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            Text(
              "Get Your Food \nDelivered to Your Class",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenHeight(30),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.03,
            ),
            Text(
              "The best delivery app in school for delivering \nyour daily food",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getProportionateScreenHeight(16),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            RoundedButton(
              width: SizeConfig.screenWidth * 0.4,
              text: "Shop Now",
              press: () {
                Navigator.pushNamed(
                  context,
                  LoginScreen.routeName,
                );
              },
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.07,
            ),
          ],
        ),
      ),
    );
  }
}
