import 'package:edufin/components/navigation_bar.dart';
import 'package:edufin/constants.dart';
import 'package:edufin/models/card.dart';
import 'package:edufin/screens/home/components/card_sheet.dart';
import 'package:edufin/screens/home/components/card_view.dart';
import 'package:edufin/screens/home/components/home_header.dart';
import 'package:edufin/screens/home/components/main_background.dart';
import 'package:edufin/screens/home/components/section_title.dart';
import 'package:edufin/screens/home/components/transaction.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  final _controller = PageController();

  bool newUser = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBackground(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            maintainBottomViewPadding: true,
            child: newUser
                ? SizedBox(
                    height: SizeConfig.screenHeight,
                    width: double.infinity,
                    child: Column(
                      children: [
                        const HomeHeader(),
                        const NoCard(),
                        SectionTitle(
                          text: 'Transaction',
                          press: () {},
                          tap: false,
                        ),
                        const NoTransaction()
                      ],
                    ),
                  )
                : Column(
                    children: [
                      const HomeHeader(),
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
                      SectionTitle(
                        text: "Transaksi",
                        press: () {},
                        tap: false,
                      ),
                      const Column(
                        children: [
                          Transaction(),
                          Transaction(),
                          Transaction(),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        onPressed: () {},
        backgroundColor: kMainColor,
        child: SvgPicture.asset(
          'assets/icons/scan.svg',
          width: getProportionateScreenHeight(30),
        ),
      ),
      bottomNavigationBar: const NavBar(currentTab: 0),
    );
  }
}

class NoCard extends StatelessWidget {
  const NoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: getProportionateScreenHeight(10),
        bottom: getProportionateScreenHeight(25),
      ),
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: SizeConfig.screenHeight * 0.28,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenHeight(20)),
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
                color: const Color(0xffB4B4B4).withOpacity(0.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    getProportionateScreenHeight(30),
                  ),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/icons/add.svg',
                        height: getProportionateScreenHeight(30),
                        width: getProportionateScreenHeight(30),
                      ),
                    ),
                    const Text('Add Card'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NoTransaction extends StatelessWidget {
  const NoTransaction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight * 0.3,
      child: Center(
        child: Text(
          'No Transaction History',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenHeight(16),
          ),
        ),
      ),
    );
  }
}
