import 'package:edufin/constants.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrView extends StatefulWidget {
  const QrView({super.key});

  @override
  State<QrView> createState() => _QrViewState();
}

class _QrViewState extends State<QrView> {
  String data = 'Aku Anak Indonesia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My QR'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(getProportionateScreenHeight(20)),
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: SizeConfig.screenWidth * 0.7,
                height: SizeConfig.screenWidth * 0.7,
                decoration: BoxDecoration(
                  color: kLineColor,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              QrImageView(
                data: data,
                version: QrVersions.auto,
                embeddedImage: AssetImage('assets/images/logo.png'),
                embeddedImageStyle:
                    QrEmbeddedImageStyle(size: Size.fromWidth(50)),
                size: SizeConfig.screenWidth * 0.6,
                backgroundColor: kTextColor,
                // dataModuleStyle: QrDataModuleStyle(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
