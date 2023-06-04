import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';

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
