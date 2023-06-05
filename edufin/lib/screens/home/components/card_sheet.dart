import 'package:edufin/components/rounded_button.dart';
import 'package:edufin/constants.dart';
import 'package:edufin/models/card.dart';
import 'package:edufin/screens/card/card_detail.dart';
import 'package:edufin/screens/card/edit_card.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';

cardSheet(context, MyCard card) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          getProportionateScreenHeight(25),
        ),
      ),
    ),
    backgroundColor: kLineColor,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(10),
          horizontal: getProportionateScreenHeight(25),
        ),
        height: SizeConfig.screenHeight * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: getProportionateScreenHeight(50),
                height: getProportionateScreenHeight(5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: kTextColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(20),
              ),
              child: Text(
                'Card 1',
                style: TextStyle(
                  color: kTextColor,
                  fontSize: getProportionateScreenHeight(26),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            RoundedButton(
              text: 'View Card',
              press: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CardDetail(
                      card: card,
                    ),
                  ),
                );
              },
              width: SizeConfig.screenHeight,
              padding: getProportionateScreenHeight(10),
            ),
            RoundedButton(
              text: 'Modify Card',
              press: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditCard(card: card)),
                );
              },
              width: SizeConfig.screenHeight,
              padding: getProportionateScreenHeight(10),
              color: const Color(0xffB4B4B4),
              textColor: const Color(0xff191B1E),
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Disable Card',
                  style: TextStyle(
                    color: const Color(0xffC8C7FA),
                    fontSize: getProportionateScreenHeight(16),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
