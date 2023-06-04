import 'package:edufin/components/rounded_button.dart';
import 'package:edufin/constants.dart';
import 'package:edufin/models/card.dart';
import 'package:edufin/models/transaction.dart';
import 'package:edufin/screens/card/ayoconnect_card_detail.dart';
import 'package:edufin/screens/home/components/card_view.dart';
import 'package:edufin/screens/home/components/section_title.dart';
import 'package:edufin/screens/home/components/transaction.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';

class CardDetail extends StatelessWidget {
  static String routeName = '/carddetail';
  const CardDetail({super.key, required this.card});

  final MyCard card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Card Detail'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: kLineColor,
            height: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                CardView(card: card),
                Container(
                  height: getProportionateScreenHeight(100),
                  // color: kTextColor,
                  padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(20),
                    left: getProportionateScreenHeight(20),
                    right: getProportionateScreenHeight(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Card Holder Name',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: getProportionateScreenHeight(16),
                          // color: kTextColor,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenHeight(15),
                        ),
                        width: SizeConfig.screenWidth,
                        height: getProportionateScreenHeight(50),
                        decoration: BoxDecoration(
                          color: kLineColor,
                          borderRadius: BorderRadius.circular(
                            getProportionateScreenHeight(14),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nabeel Muhammad Diaz',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: getProportionateScreenHeight(16),
                                // color: kTextColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: getProportionateScreenHeight(100),
                  // color: kTextColor,
                  padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(10),
                    left: getProportionateScreenHeight(20),
                    right: getProportionateScreenHeight(20),
                    bottom: getProportionateScreenHeight(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Saldo',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: getProportionateScreenHeight(16),
                          // color: kTextColor,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenHeight(15),
                        ),
                        width: SizeConfig.screenWidth,
                        height: getProportionateScreenHeight(50),
                        decoration: BoxDecoration(
                          color: kLineColor,
                          borderRadius: BorderRadius.circular(
                            getProportionateScreenHeight(14),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rp500.000',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: getProportionateScreenHeight(16),
                                // color: kTextColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SectionTitle(
                  text: "Transaksi",
                  press: () {},
                  tap: false,
                ),
                ...List.generate(
                  demoTransaction.length,
                  (index) =>
                      TransactionView(transaction: demoTransaction[index]),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenHeight(20),
        ),
        child: RoundedButton(
          text: 'Card Detail',
          press: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const WebViewPage(),
              ),
            );
          },
          width: SizeConfig.screenWidth,
        ),
      ),
    );
  }
}
