import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_like_css/gradient_like_css.dart';
import 'package:path_provider/path_provider.dart';

class DetailTransaction extends StatelessWidget {
  const DetailTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Detail'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: getProportionateScreenHeight(20),
            left: getProportionateScreenHeight(20),
            right: getProportionateScreenHeight(20),
            top: getProportionateScreenHeight(10),
          ),
          child: Stack(
            children: [
              Container(
                height: SizeConfig.screenHeight * 0.82,
                width: SizeConfig.screenWidth * 0.9,
                decoration: BoxDecoration(
                  gradient: linearGradient(
                    180,
                    ['#BDBCFF 0%', '#D2D1FF 28.65%', '#E2E1FF 100%'],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/transaction.png',
                    width: 50,
                    height: 50,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
