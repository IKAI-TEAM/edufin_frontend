import 'dart:developer';

import 'package:edufin/constants.dart';
import 'package:edufin/services/shared_service.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatefulWidget {
  HomeHeader({Key? key}) : super(key: key);

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  late Future<Map<String, dynamic>> userInfo;

  @override
  void initState() {
    super.initState();
    userInfo = SharedService.getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: userInfo,
      builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final userInfo = snapshot.data!;
          return buildHeader(userInfo);
        } else {
          return Text('No data available');
        }
      },
    );
  }

  Widget buildHeader(Map<String, dynamic> userInfo) {
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(20),
        right: getProportionateScreenWidth(20),
        bottom: getProportionateScreenHeight(20),
        top: getProportionateScreenHeight(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(15),
                ),
                width: SizeConfig.screenWidth * 0.7,
                height: SizeConfig.screenWidth * 0.12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(14),
                        color: kTextColor,
                      ),
                    ),
                    Text(
                      userInfo['fullName'] + " (" + userInfo['accountType'] +")" , // Use userInfo fullName here
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(18),
                        color: kTextColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.notifications_none_rounded,
          //     size: getProportionateScreenHeight(30),
          //     color: kTextColor,
          //   ),
          // )
        ],
      ),
    );
  }
}
