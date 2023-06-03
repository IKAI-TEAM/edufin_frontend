import 'package:edufin/constants.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              // Container(
              //   width: SizeConfig.screenWidth * 0.12,
              //   height: SizeConfig.screenWidth * 0.12,
              //   decoration: const BoxDecoration(
              //     image: DecorationImage(
              //       image: NetworkImage(
              //           "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
              //       fit: BoxFit.cover,
              //     ),
              //     borderRadius: BorderRadius.all(
              //       Radius.circular(30),
              //     ),
              //   ),
              // ),
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
                      "Good Morning",
                      style: TextStyle(
                          fontSize: getProportionateScreenHeight(14),
                          color: kTextColor),
                    ),
                    Text(
                      "Nabeel Muhammad Diaz",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(18),
                        color: kTextColor,
                      ),
                      // overflow: TextOverflow.ellipsis,
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
