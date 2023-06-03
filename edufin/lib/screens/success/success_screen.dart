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
                  horizontal: getProportionateScreenWidth(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      width: SizeConfig.screenWidth * 0.2,
                      height: SizeConfig.screenWidth * 0.2,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Image.asset(
                      "assets/images/sukses.png",
                      width: SizeConfig.screenWidth * 0.9,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.05,
                    ),
                    Text(
                      "Masuk Berhasil!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(34),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.02,
                    ),
                    Text(
                      "Proses masuk yang anda lakukan\n telah berhasil, anda dapat lanjut ke Halaman Utama",
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
                      text: 'Lanjut ke Halaman Utama',
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
