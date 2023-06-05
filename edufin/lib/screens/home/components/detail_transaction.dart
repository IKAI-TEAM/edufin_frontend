import 'package:edufin/constants.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_like_css/gradient_like_css.dart';

class DetailTransaction extends StatelessWidget {
  const DetailTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
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
            alignment: Alignment.topCenter,
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
              Container(
                // padding: EdgeInsets.only(
                //   bottom: getProportionateScreenHeight(30),
                //   left: getProportionateScreenHeight(30),
                //   right: getProportionateScreenHeight(30),
                //   top: getProportionateScreenHeight(35),
                // ),
                height: SizeConfig.screenHeight * 0.82,
                width: SizeConfig.screenWidth * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: getProportionateScreenHeight(30),
                        right: getProportionateScreenHeight(30),
                        top: getProportionateScreenHeight(35),
                      ),
                      height: SizeConfig.screenHeight * 0.35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/transaction.png',
                          ),
                          Text(
                            'Transaction Success',
                            style: TextStyle(
                              fontSize: getProportionateScreenHeight(24),
                              fontWeight: FontWeight.bold,
                              color: kMainColor,
                            ),
                          ),
                          Text(
                            'Total Transactions',
                            style: TextStyle(
                              fontSize: getProportionateScreenHeight(18),
                              color: kBackgroundColor,
                            ),
                          ),
                          Text(
                            'Rp208.000',
                            style: TextStyle(
                              fontSize: getProportionateScreenHeight(30),
                              fontWeight: FontWeight.w900,
                              color: kMainColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/halfcircle1.svg',
                          width: SizeConfig.screenWidth * 0.04,
                        ),
                        DottedLine(
                          direction: Axis.horizontal,
                          lineLength: SizeConfig.screenWidth * 0.82,
                          lineThickness: 2.0,
                          dashColor: Colors.black,
                          dashGapLength: 5.0,
                        ),
                        SvgPicture.asset(
                          'assets/icons/halfcircle2.svg',
                          width: SizeConfig.screenWidth * 0.04,
                        ),
                      ],
                    ),
                    Container(
                      // color: Colors.amber,
                      padding: EdgeInsets.only(
                        bottom: getProportionateScreenHeight(30),
                        left: getProportionateScreenHeight(30),
                        right: getProportionateScreenHeight(30),
                      ),
                      height: SizeConfig.screenHeight * 0.35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Transaction Details',
                            style: TextStyle(
                              color: kBackgroundColor,
                              fontSize: getProportionateScreenHeight(18),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Transaction ID',
                                style: TextStyle(
                                  color: kLineColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: getProportionateScreenHeight(15),
                                ),
                              ),
                              Text(
                                '42345883',
                                style: TextStyle(
                                  color: kBackgroundColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenHeight(15),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Date and Time',
                                style: TextStyle(
                                  color: kLineColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: getProportionateScreenHeight(15),
                                ),
                              ),
                              Text(
                                '07/09/2005 - 20:00',
                                style: TextStyle(
                                  color: kBackgroundColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenHeight(15),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Type',
                                style: TextStyle(
                                  color: kLineColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: getProportionateScreenHeight(15),
                                ),
                              ),
                              Text(
                                'Top Up',
                                style: TextStyle(
                                  color: kBackgroundColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenHeight(15),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Format',
                                style: TextStyle(
                                  color: kLineColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: getProportionateScreenHeight(15),
                                ),
                              ),
                              Text(
                                'Bank Transfer',
                                style: TextStyle(
                                  color: kBackgroundColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenHeight(15),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'From',
                                style: TextStyle(
                                  color: kLineColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: getProportionateScreenHeight(15),
                                ),
                              ),
                              Text(
                                'Card 1',
                                style: TextStyle(
                                  color: kBackgroundColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenHeight(15),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
