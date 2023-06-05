import 'dart:developer';

import 'package:edufin/components/rounded_button.dart';
import 'package:edufin/constants.dart';
import 'package:edufin/models/card.dart';
import 'package:edufin/models/transaction.dart';
import 'package:edufin/screens/card/ayoconnect_card_detail.dart';
import 'package:edufin/screens/home/components/card_view.dart';
import 'package:edufin/screens/home/components/no_transaction.dart';
import 'package:edufin/screens/home/components/section_title.dart';
import 'package:edufin/screens/home/components/transaction.dart';
import 'package:edufin/services/api_services.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:edufin/services/local_cards_services.dart';
import 'package:edufin/services/local_histories_services.dart';

class CardDetail extends StatefulWidget {
  static String routeName = '/carddetail';
  const CardDetail({super.key, required this.card, required this.cardId});

  final MyCard card;
  final String cardId;

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  late Future<String> cardInfoList;
  late Future<List<Map<String, dynamic>>> historyList;

  @override
  void initState() {
    super.initState();
    cardInfoList = APIService.getCardDetail(widget.cardId);
    historyList = localHistoriesServices.getHistoryList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([historyList, cardInfoList]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(), // Show a loading indicator while fetching data
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final List<Map<String, dynamic>> historyListData = snapshot.data![0];
          final String cardInfoList = snapshot.data![1];
          // log(cardListData.toString());
          log(historyListData.toString());
          return buildCardDetail(historyListData, cardInfoList);
        } else {
          return Text('No data available');
        }
        
      },
    );
  }

  @override
  Widget buildCardDetail(List<Map<String, dynamic>> historyList, String cardInfoList) {
    log(cardInfoList);
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
                CardView(card: widget.card),
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
                historyList.isEmpty
                    ? const NoTransaction()
                    : Column(
                        children: [
                          ...List.generate(
                            historyList.length,
                            (index) { 
                              if(index < 3) {
                                return TransactionView(
                                  transaction: Transaction(transactionId: historyList[index]['transaction_id'], merchantName: historyList[index]['merchant_name'], amount: historyList[index]['amount']),
                                );
                              }
                              return SizedBox.shrink();
                            }
                          )
                        ],
                      ),
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
                builder: (BuildContext context) => WebViewPage(url: cardInfoList),
              ),
            );
          },
          width: SizeConfig.screenWidth,
        ),
      ),
    );
  }
}
