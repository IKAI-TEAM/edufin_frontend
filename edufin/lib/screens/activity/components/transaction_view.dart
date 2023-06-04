import 'package:edufin/constants.dart';
import 'package:edufin/currency_formatter.dart';
import 'package:edufin/models/transaction.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransactionRow extends StatelessWidget {
  const TransactionRow({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(55),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: getProportionateScreenHeight(10),
                    right: getProportionateScreenHeight(20),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/cashin.svg',
                    width: getProportionateScreenHeight(20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        transaction.type,
                        style: TextStyle(
                          color: kTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenHeight(16),
                        ),
                      ),
                      Text(
                        transaction.description,
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(14),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Text(
            '+ ${CurrencyFormat.convertToIdr(transaction.amount, 0)}',
            style: TextStyle(
              fontSize: getProportionateScreenHeight(16),
              fontWeight: FontWeight.bold,
              color: kTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
