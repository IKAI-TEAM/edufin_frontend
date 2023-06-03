import 'package:edufin/screens/register/components/register.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = '/register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
            width: double.infinity,
            height: SizeConfig.screenHeight,
            child: const Register(text: 'Parent')),
      ),
    );
  }
}
