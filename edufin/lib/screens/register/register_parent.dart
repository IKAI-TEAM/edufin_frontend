import 'package:edufin/screens/register/components/register.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';

class RegisterParent extends StatefulWidget {
  static String routeName = '/register';
  const RegisterParent({super.key});

  @override
  State<RegisterParent> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterParent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight,
          child: const Register(text: 'Parent'),
        ),
      ),
    );
  }
}
