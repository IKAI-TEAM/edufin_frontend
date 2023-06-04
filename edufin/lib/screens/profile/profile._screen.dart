import 'package:edufin/components/navigation_bar.dart';
import 'package:edufin/constants.dart';
import 'package:edufin/screens/qr/qr_view.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List onTap = [
      QrView(),
    ];

    List assets = [
      'assets/icons/qr.svg',
      'assets/icons/profile.svg',
      'assets/icons/logout.svg',
    ];

    List text = ['Scan QR Code', 'Profile', 'Log Out'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Account'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: kLineColor,
            height: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              Container(
                height: getProportionateScreenHeight(100),
                width: getProportionateScreenHeight(100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenHeight(50),
                  ),
                  color: const Color(0xffCDB4DB),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(10),
                ),
                height: getProportionateScreenHeight(85),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Nabeel Muhammad Diaz',
                      style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(24),
                      ),
                    ),
                    Text(
                      'nabeelmuhammadd@gmail.com',
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(18),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(10),
                ),
                child: Column(
                  children: [
                    ...List.generate(
                      3,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const QrView(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: getProportionateScreenHeight(12),
                            ),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: kLineColor,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: getProportionateScreenHeight(15),
                                      ),
                                      child: SizedBox(
                                        width: getProportionateScreenHeight(30),
                                        child: Center(
                                          child: SvgPicture.asset(
                                            assets[index],
                                            height:
                                                getProportionateScreenHeight(
                                                    20),
                                            width: getProportionateScreenHeight(
                                                20),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      text[index],
                                      style: TextStyle(
                                        fontSize:
                                            getProportionateScreenHeight(14),
                                        fontWeight: FontWeight.bold,
                                        color: kTextColor,
                                      ),
                                    )
                                  ],
                                ),
                                const Icon(Icons.arrow_forward_ios_rounded),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
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
      bottomNavigationBar: const NavBar(currentTab: 2),
    );
  }
}
