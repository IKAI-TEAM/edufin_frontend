import 'package:edufin/components/rounded_button.dart';
import 'package:edufin/constants.dart';
import 'package:edufin/models/card.dart';
import 'package:edufin/screens/home/components/card_view.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key, required this.card});

  final MyCard card;

  @override
  Widget build(BuildContext context) {
    Map data = {
      'name': 'Nabeel Muhammad Diaz',
      'email': 'nabeel@gmail.com',
      'govid': '3204829463827394',
    };

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add New Card'),
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
                CardView(card: card),
                Container(
                  height: getProportionateScreenHeight(100),
                  // color: kTextColor,
                  padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(20),
                    left: getProportionateScreenHeight(20),
                    right: getProportionateScreenHeight(20),
                  ),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Card Holder Name',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: getProportionateScreenHeight(16),
                          ),
                        ),
                        TextFormField(
                          initialValue: '${data['name']}',
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return kNameInvalid;
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: kLineColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                getProportionateScreenHeight(14),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                getProportionateScreenHeight(14),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                getProportionateScreenHeight(14),
                              ),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(16),
                            fontWeight: FontWeight.w500,
                            color: kSecondaryTextColor,
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(30),
                            FilteringTextInputFormatter.singleLineFormatter,
                          ],
                        ),
                      ],
                    ),
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
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: getProportionateScreenHeight(16),
                          // color: kTextColor,
                        ),
                      ),
                      TextFormField(
                        initialValue: '${data['email']}',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return kEmailInvalid;
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: kLineColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(14),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(14),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(14),
                            ),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(16),
                          fontWeight: FontWeight.w500,
                          color: kSecondaryTextColor,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(30),
                          FilteringTextInputFormatter.singleLineFormatter,
                        ],
                      ),
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
                        'Government ID',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: getProportionateScreenHeight(16),
                          // color: kTextColor,
                        ),
                      ),
                      TextFormField(
                        initialValue: '${data['govid']}',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return kGovernmentIdInvalid;
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: kLineColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(14),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(14),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(14),
                            ),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(16),
                          fontWeight: FontWeight.w500,
                          color: kSecondaryTextColor,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(16),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
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
                        'Spend Limit',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: getProportionateScreenHeight(16),
                          // color: kTextColor,
                        ),
                      ),
                      TextFormField(
                        // initialValue: ,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return kEmailInvalid;
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: kLineColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(14),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(14),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(14),
                            ),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(16),
                          fontWeight: FontWeight.w500,
                          color: kSecondaryTextColor,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
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
                        'Card Validity',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: getProportionateScreenHeight(16),
                          // color: kTextColor,
                        ),
                      ),
                      TextFormField(
                        // initialValue: ,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return kEmailInvalid;
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: kLineColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(14),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(14),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              getProportionateScreenHeight(14),
                            ),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(16),
                          fontWeight: FontWeight.w500,
                          color: kSecondaryTextColor,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(2),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ],
                  ),
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
          text: 'Add Card',
          press: () {},
          width: SizeConfig.screenWidth,
        ),
      ),
    );
  }

  void addCard() async {
    String name;
    String email;
    int govid;
    int spendLimit;
    int validity;
  }
}
