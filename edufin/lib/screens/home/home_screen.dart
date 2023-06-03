import 'package:flutter/material.dart';
import 'components/home_body.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainBody(),
    );
  }
}
