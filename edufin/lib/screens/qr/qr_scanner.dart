import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:edufin/constants.dart';
import 'package:edufin/models/card.dart';
import 'package:edufin/screens/card/add_card.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;
  Barcode? barcode;
  String? text;

  bool isCodeDetected = false;
  var addCardPage;

  Future<void> openAddCard(Map<String, dynamic>? decodedJson) async {

    
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        //TANDA EDIT P BELOMAN
        builder: (BuildContext context) => AddCard(card: demoCard[0], scannedJson: decodedJson)
      ),
    );

    if (result != null) {
      log("result not null");
      setState(() {
        isCodeDetected = result;
      });
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream.listen((barcode) async {
      if(!isCodeDetected) {
        setState(() {
          this.barcode = barcode;
          text = barcode.code;
          try {
            Map<String, dynamic> decodedJson = jsonDecode(text.toString());

            isCodeDetected = true;
            
            openAddCard(decodedJson);

            // addCardPage = Navigator.of(context).push(
            //   MaterialPageRoute(
            //     //TANDA EDIT P BELOMAN
            //     builder: (BuildContext context) => AddCard(card: demoCard[0], scannedJson: decodedJson)
            //   )
            // );
            
          

          } catch (e, stackTrace) {
            log(stackTrace.toString());
            log(e.toString());
            log("error");
          }

          return;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scan QR Code',
          style: TextStyle(),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            QRView(
              key: qrKey,
              onQRViewCreated: onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: kMainColor,
                borderRadius: 25,
                borderLength: 25,
                borderWidth: 15,
                cutOutSize: SizeConfig.screenWidth * 0.7,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kBackgroundColor,
        onPressed: () async {
          await controller?.toggleFlash();
        },
        child: Icon(
          Icons.flash_on_rounded,
          size: getProportionateScreenHeight(40),
          weight: 10,
          color: kMainColor,
        ),
      ),
    );
  }
}
