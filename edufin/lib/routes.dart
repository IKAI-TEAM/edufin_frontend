import 'package:edufin/screens/activity/activity_screen.dart';
import 'package:edufin/screens/chat/chat_screen.dart';
// import 'package:edufin/screens/details/card_detail.dart';
import 'package:edufin/screens/home/home_screen.dart';
import 'package:edufin/screens/login/login_screen.dart';
import 'package:edufin/screens/profile/profile._screen.dart';
import 'package:edufin/screens/register/register_child.dart';
import 'package:edufin/screens/register/register_parent.dart';
import 'package:edufin/screens/splash/splash_screen.dart';
import 'package:edufin/screens/success/success_screen.dart';
import 'package:edufin/screens/verification/verification_screen.dart';
import 'package:edufin/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  RegisterParent.routeName: (context) => const RegisterParent(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  VerificationScreen.routeName: (context) => const VerificationScreen(),
  RegisterChild.routeName: (context) => const RegisterChild(),
  SuccessScreen.routeName: (context) => const SuccessScreen(),
  HomePage.routeName: (context) => const HomePage(),
  ActivityScreen.routeName: (context) => const ActivityScreen(),
  ChatScreen.routeName: (context) => const ChatScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  // CardDetail.routeName: (context) => const CardDetail(),
};
