import 'package:edufin/screens/register/components/register.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';

class DataRegister extends StatefulWidget {
  static String routeName = '/registerbocil';
  const DataRegister({super.key});
  @override
  State<DataRegister> createState() => _DataRegisterState();
}

class _DataRegisterState extends State<DataRegister> {
  String phoneVal = r'^(\+62|62|0)8[1-9][0-9]{6,9}$';
  String nameVal = r'^[a-z A-Z]+$';
  String emailVal =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  String governmentIdVal =
      r'^(1[1-9]|21|[37][1-6]|5[1-3]|6[1-5]|[89][12])\d{2}\d{2}([04][1-9]|[1256][0-9]|[37][01])(0[1-9]|1[0-2])\d{2}\d{4}$';

  String phoneNum = '';
  String email = '';
  String name = '';
  String governmentId = '';

  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight,
          child: const Register(text: 'Bocil'),
        ),
      ),
    );
  }
}
