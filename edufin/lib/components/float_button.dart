import 'package:edufin/constants.dart';
import 'package:edufin/screens/qr/qr_scanner.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 3,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const QrScanner(),
          ),
        );
      },
      backgroundColor: kMainColor,
      child: SvgPicture.asset(
        'assets/icons/scan.svg',
        width: getProportionateScreenHeight(30),
      ),
    );
  }
}
