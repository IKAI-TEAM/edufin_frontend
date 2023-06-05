import 'package:edufin/constants.dart';
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
              width: SizeConfig.screenWidth * 0.3,
              height: SizeConfig.screenWidth * 0.3,
              decoration: const BoxDecoration(
                // color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "assets/icons/vectorlogo.png",
              ),
            ),
            Text(
              "Control your children financial\nmanagement through EduFin.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kTextColor,
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenHeight(20),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            Text(
              "Teach children to manage their spends.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getProportionateScreenHeight(16),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.02,
            ),
            RoundedButton(
              width: SizeConfig.screenWidth * 0.5,
              text: "Start Now",
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
