import 'package:edufin/constants.dart';
import 'package:edufin/routes.dart';
import 'package:edufin/screens/splash/splash_screen.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:edufin/dismiss_keyboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DismissKeyboard(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Edufin',
        theme: ThemeData(
          fontFamily: 'DM Sans',
          primaryColor: kMainColor,
          scaffoldBackgroundColor: kBackgroundColor,
          iconTheme: const IconThemeData(color: kMainColor),
          textTheme: const TextTheme(
            titleMedium: TextStyle(color: kTextColor),
            // ignore: deprecated_member_use
            bodyLarge: TextStyle(color: kTextColor),
            // ignore: deprecated_member_use
            bodyMedium: TextStyle(color: kSecondaryTextColor),
          ),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(
              color: kSecondaryTextColor,
              fontWeight: FontWeight.w500,
              fontSize: getProportionateScreenHeight(16),
            ),
            floatingLabelStyle: const TextStyle(color: kTextColor),
            hintStyle: TextStyle(color: kSecondaryTextColor.withOpacity(0.7)),
            focusColor: kTextColor,
            // counterStyle: TextStyle(color: kTextColor),
            // filled: true,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: kSecondaryTextColor,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: kTextColor,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: kErrorColor,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: kErrorColor,
              ),
            ),
          ),
          appBarTheme: AppBarTheme(
              backgroundColor: kBackgroundColor,
              centerTitle: true,
              toolbarHeight: getProportionateScreenHeight(60)),
        ),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
