import 'package:edufin/constants.dart';
import 'package:edufin/currency_formatter.dart';
import 'package:edufin/models/card.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  const CardView({
    super.key,
    required this.card,
  });

  final MyCard card;

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  String addZero(int num) {
    if (num < 10) {
      return '0$num';
    } else {
      return num.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
      child: Container(
        padding: EdgeInsets.only(
          bottom: getProportionateScreenHeight(20),
          top: getProportionateScreenHeight(15),
          left: getProportionateScreenHeight(30),
          right: getProportionateScreenHeight(30),
        ),
        width: SizeConfig.screenWidth * 0.85,
        height: SizeConfig.screenHeight * 0.25,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: kGradientColor,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              getProportionateScreenHeight(30),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: getProportionateScreenHeight(70),
                  height: getProportionateScreenHeight(70),
                  child: Center(
                    child: Text(
                      "Edufin",
                      style: TextStyle(
                        color: kBackgroundColor,
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(22),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: getProportionateScreenHeight(70),
                  height: getProportionateScreenHeight(70),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icons/mastercard.png'),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  3,
                  (index) {
                    return Text(
                      'XXXX',
                      style: TextStyle(
                        color: kBackgroundColor,
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(18),
                      ),
                    );
                  },
                ),
                Text(
                  widget.card.cardNum.toString(),
                  style: TextStyle(
                    color: kBackgroundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenHeight(18),
                  ),
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Balance',
                        style: TextStyle(
                          color: Color(0xff3C3C3C),
                        ),
                      ),
                      Text(
                        CurrencyFormat.convertToIdr(widget.card.balance, 0),
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(16),
                          fontWeight: FontWeight.bold,
                          color: kBackgroundColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Valid Thru',
                        style: TextStyle(
                          color: Color(0xff3C3C3C),
                        ),
                      ),
                      Text(
                        '${addZero(widget.card.expiryMonth)}/${addZero(widget.card.expiryYear)}',
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(16),
                          fontWeight: FontWeight.bold,
                          color: kBackgroundColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
