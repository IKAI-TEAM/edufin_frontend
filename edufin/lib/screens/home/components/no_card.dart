import 'package:edufin/services/shared_service.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoCard extends StatefulWidget {
  const NoCard({super.key});

  @override
  _NoCardState createState() => _NoCardState();
}

class _NoCardState extends State<NoCard> {
  late Future<Map<String, dynamic>> userInfo;

  @override
  void initState() {
    super.initState();
    userInfo = SharedService.getUserInfo(); // Replace getUserInfo with your actual function to fetch user info
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: userInfo,
      builder:
          (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final userInfo = snapshot.data!;
          return buildNoCardWidget(userInfo);
        } else {
          return Text('No data available');
        }
      },
    );
  }

  Widget buildNoCardWidget(Map<String, dynamic> userInfo) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
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
                  userInfo['accountType'] == 'parents' ? 'assets/icons/add.svg' : 'assets/icons/add.svg',
                  height: getProportionateScreenHeight(30),
                  width: getProportionateScreenHeight(30),
                ),
              ),
              Text(userInfo['accountType'] == 'parents' ? 'Add Card' : 'Request Card'), // Display user name if available
            ],
          ),
        ),
      ),
    );
  }
}