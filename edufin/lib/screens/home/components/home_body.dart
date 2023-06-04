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

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  final _controller = PageController();

  bool noCard = false;
  bool noTransaction = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBackground(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            maintainBottomViewPadding: true,
            child: Column(
              children: [
                const HomeHeader(),
                noCard
                    ? const NoCard()
                    : Column(
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
                                    demoCard.length,
                                    (index) => GestureDetector(
                                      onTap: () =>
                                          cardSheet(context, demoCard[index]),
                                      child: CardView(card: demoCard[index]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SmoothPageIndicator(
                            controller: _controller,
                            count: demoCard.length,
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
                noTransaction
                    ? const NoTransaction()
                    : Column(
                        children: [
                          ...List.generate(
                            demoTransaction.length,
                            (index) => TransactionView(
                                transaction: demoTransaction[index]),
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
