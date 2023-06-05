import 'package:edufin/screens/register/components/register.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';

class RegisterChild extends StatefulWidget {
  static String routeName = '/registerbocil';
  const RegisterChild({super.key});
  @override
  State<RegisterChild> createState() => _RegisterChildState();
}

class _RegisterChildState extends State<RegisterChild> {
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
