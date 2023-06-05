import 'dart:developer';

import 'package:edufin/components/form_error.dart';
import 'package:edufin/components/rounded_button.dart';
import 'package:edufin/constants.dart';
import 'package:edufin/models/auth/login_request_model.dart';
import 'package:edufin/screens/register/register_parent.dart';
import 'package:edufin/screens/success/success_screen.dart';
import 'package:edufin/services/api_services.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // String passwordVal = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
  // String emailVal = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  String password = '';
  String email = '';

  bool isValid = false;
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();

  String error = '';

  // Set controller text here
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        child: SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                      width: SizeConfig.screenWidth * 0.3,
                      height: SizeConfig.screenWidth * 0.3,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "assets/icons/vectorlogo.png",
                      ),
                    ),
                    Text(
                      "Welcome to \nEduFin!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(42),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.022,
                    ),
                    SizedBox(
                      // width: SizeConfig.screenWidth * 0.6,
                      child: Text(
                        "Sign In to continue",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: getProportionateScreenHeight(18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(70),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.2,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextFormField(
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return kEmailInvalid;
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: 'example@gmail.com',
                                labelText: 'Email',
                                // alignLabelWithHint: false,
                              ),
                              style: TextStyle(
                                fontSize: getProportionateScreenHeight(20),
                                fontWeight: FontWeight.w500,
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(30),
                                FilteringTextInputFormatter.singleLineFormatter,
                              ],
                              onChanged: (value) {
                                setState(
                                  () {
                                    email = value;
                                    error = '';
                                  },
                                );
                              },
                            ),
                            TextFormField(
                              controller: passwordController,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: !_passwordVisible,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return kPasswordInvalid;
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Password',
                                suffixIcon: IconButton(
                                  splashRadius: 0.1,
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: kSecondaryTextColor,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                              ),
                              style: TextStyle(
                                fontSize: getProportionateScreenHeight(20),
                                fontWeight: FontWeight.w500,
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(20),
                                FilteringTextInputFormatter.singleLineFormatter,
                              ],
                              onChanged: (value) {
                                setState(
                                  () {
                                    password = value;
                                    error = '';
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    // INI BUAT CUSTOM ERROR TEXT
                    FormError(error: error),
                    SizedBox(
                      height: getProportionateScreenHeight(40),
                    ),
                    RoundedButton(
                        width: SizeConfig.screenWidth * 0.8,
                        text: 'Masuk',
                        press: loginUser),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(30)),
                      child: SizedBox(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(text: "Don't have an account? "),
                              TextSpan(
                                text: 'Register here',
                                style: const TextStyle(color: kMainColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                      context,
                                      RegisterParent.routeName,
                                    );
                                  },
                              ),
                            ],
                          ),
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginUser() async {
    // Preparing the data
    String email = emailController.text;
    String password_login = passwordController.text;

    // Build model
    LoginRequestModel requestModel = LoginRequestModel(
      email: email,
      password: password_login,
    );
    // Call the api service
    Map<String, dynamic> requestLogin =
        await APIService.loginUser(requestModel);

    if (requestLogin['success']) {
      log("saksess");
      log("Pushh");
      // Navigate to VerificationScreen if success
      await APIService.getUserHistory();
      Navigator.pushNamed( context, SuccessScreen.routeName );

      return;
    }

    log(requestLogin['error']);

    // Reiii notes >
    // Kalo kodenya sampe sini, berarti login gagal, kasih error alert atau apalah bebas
    // Nabeel error
    // Variable error message : requestLogin['error']
    setState(() {
      error = 'Incorrect email or password';
    });
  }
}
