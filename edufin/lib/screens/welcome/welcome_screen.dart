import 'package:flutter/material.dart';
import 'components/body.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = '/welcome';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
