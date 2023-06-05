import 'package:edufin/constants.dart';
import 'package:edufin/currency_formatter.dart';
import 'package:edufin/models/transaction.dart';
import 'package:edufin/screens/home/components/detail_transaction.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(10),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const DetailTransaction()));
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(15),
            horizontal: getProportionateScreenHeight(12),
          ),
          width: SizeConfig.screenWidth * 0.9,
          height: SizeConfig.screenHeight * 0.1,
          decoration: BoxDecoration(
            color: Color(0xff191B1E),
            borderRadius: BorderRadius.all(
              Radius.circular(
                getProportionateScreenHeight(10),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: getProportionateScreenHeight(42),
                    height: getProportionateScreenHeight(42),
                    decoration: BoxDecoration(
                      color: Color(0xffFFD4BA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenHeight(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          transaction.merchantName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenHeight(16),
                            color: kTextColor,
                          ),
                        ),
                        Text(
                          "Payment",
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(12),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    CurrencyFormat.convertToIdr(transaction.amount, 0),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenHeight(15),
                      color: kTextColor,
                    ),
                  ),
                  Text(
                    // Payment date homepage
                    "14 April 2023",
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(12),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
