import 'package:edufin/components/navigation_bar.dart';
import 'package:edufin/constants.dart';
import 'package:edufin/models/transaction.dart';
import 'package:edufin/screens/activity/components/transaction_view.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActivityScreen extends StatelessWidget {
  static String routeName = "/activity";
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('History Transaction'),
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
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenHeight(10),
              ),
              child: Column(
                children: [
                  ...List.generate(transactionDay.length, (i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: getProportionateScreenHeight(8),
                              top: getProportionateScreenHeight(20)),
                          child: const Text(
                            '16 May 2023',
                          ),
                        ),
                        ...List.generate(
                          transactionDay[i].length,
                          (index) => TransactionRow(
                            transaction: transactionDay[i][index],
                          ),
                        )
                      ],
                    );
                  }),
                ],
              ),
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
      bottomNavigationBar: const NavBar(currentTab: 1),
    );
  }
}
