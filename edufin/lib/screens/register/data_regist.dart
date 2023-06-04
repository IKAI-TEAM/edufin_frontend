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
