import 'dart:developer';

import 'package:edufin/components/float_button.dart';
import 'package:edufin/components/navigation_bar.dart';
import 'package:edufin/constants.dart';
import 'package:edufin/models/card.dart';
import 'package:edufin/models/transaction.dart';
import 'package:edufin/screens/home/components/card_sheet.dart';
import 'package:edufin/screens/home/components/card_view.dart';
import 'package:edufin/screens/home/components/home_header.dart';
import 'package:edufin/screens/home/components/main_background.dart';
import 'package:edufin/screens/home/components/no_card.dart';
import 'package:edufin/screens/home/components/no_transaction.dart';
import 'package:edufin/screens/home/components/section_title.dart';
import 'package:edufin/screens/home/components/transaction.dart';
import 'package:edufin/size_config.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:edufin/services/local_cards_services.dart';
import 'package:edufin/services/local_histories_services.dart';

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  late Future<List<Map<String, dynamic>>> cardList;
  late Future<List<Map<String, dynamic>>> historyList;
  final _controller = PageController();

  bool noCard = false;
  bool noTransaction = true;

  @override
  void initState() {
    super.initState();
    cardList = localCardsServices.getCardList();
    historyList = localHistoriesServices.getHistoryList();
  }


@override
Widget build(BuildContext context) {
  return FutureBuilder(
    future: Future.wait([cardList, historyList]),
    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(), // Show a loading indicator while fetching data
        );
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        final List<Map<String, dynamic>> cardListData = snapshot.data![0];
        final List<Map<String, dynamic>> historyListData = snapshot.data![1];
        log(cardListData.toString());
        log(historyListData.toString());
        return buildCard(cardListData, historyListData);
      } else {
        return Text('No data available');
      }
      
    },
  );
}

  Widget buildCard(List<Map<String, dynamic>> cardList, List<Map<String, dynamic>> historyList) {
    log(cardList.toString());
    log("cardlist");
    return Scaffold(
      body: MainBackground(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            maintainBottomViewPadding: true,
            child: Column(
              children: [
                const HomeHeader(),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: getProportionateScreenHeight(10),
                        bottom: getProportionateScreenHeight(25),
                      ),
                      child: SizedBox(
                        height: SizeConfig.screenHeight * 0.28,
                        child: PageView(
                          scrollDirection: Axis.horizontal,
                          controller: _controller,
                          children: [
                            ...List.generate(
                              !noCard ? cardList.length : 0,
                              (index) {
                                // print(
                                //     'Index: ${cardList[index]['masked_card'].runtimeType}');
                                return GestureDetector(
                                  // ignore: avoid_print
                                  // List dari cardList
                                  onTap: () => cardSheet(
                                    context,
                                    MyCard(
                                      cardNum: cardList[index]['masked_card'],
                                      balance: 0,
                                      expiryMonth: cardList[index]
                                          ['expiry_month'],
                                      expiryYear: cardList[index]
                                          ['expiry_year'],
                                    ),
                                  ),

                                  child: CardView(
                                    card: MyCard(
                                      cardNum: cardList[index]['masked_card'],
                                      balance: 0,
                                      expiryMonth: cardList[index]
                                          ['expiry_month'],
                                      expiryYear: cardList[index]
                                          ['expiry_year'],
                                    ),
                                  ),
                                );
                              },
                            ),
                            const NoCard()
                          ],
                        ),
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: cardList.isEmpty ? 0 : cardList.length + 1,
                      effect: WormEffect(
                        type: WormType.underground,
                        activeDotColor: kMainColor,
                        dotHeight: getProportionateScreenHeight(10),
                        dotWidth: getProportionateScreenHeight(10),
                      ),
                    ),
                  ],
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
                            (index) => TransactionView(
                              transaction: Transaction(transactionId: historyList[index]['transaction_id'], merchantName: historyList[index]['merchant_name'], amount: historyList[index]['amount']),
                            ),
                          )
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatButton(),
      bottomNavigationBar: const NavBar(currentTab: 0),
    );
  }
}
