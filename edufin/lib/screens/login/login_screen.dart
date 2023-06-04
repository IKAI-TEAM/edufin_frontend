import 'dart:developer';

import 'package:edufin/components/rounded_button.dart';
import 'package:edufin/constants.dart';
import 'package:edufin/models/auth/login_request_model.dart';
import 'package:edufin/screens/register/register_screen.dart';
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
  final _formKey = GlobalKey<FormState>();

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
              Positioned(
                top: getProportionateScreenHeight(45),
                left: getProportionateScreenWidth(10),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(45),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                    //   width: SizeConfig.screenWidth * 0.2,
                    //   height: SizeConfig.screenWidth * 0.2,
                    //   decoration: const BoxDecoration(
                    //     color: Colors.white,
                    //     shape: BoxShape.circle,
                    //   ),
                    //   child: Image.asset(
                    //     "assets/images/logo.png",
                    //     width: SizeConfig.screenWidth * 0.1,
                    //     height: SizeConfig.screenWidth * 0.1,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: SizeConfig.screenHeight * 0.04,
                    // ),
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: SizedBox(
                    //     // width: SizeConfig.screenWidth * 0.6,
                    //     child: Text(
                    //       "Welcome to \nE-Kantin",
                    //       textAlign: TextAlign.start,
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: getProportionateScreenHeight(42),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: SizeConfig.screenHeight * 0.02,
                    // ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        // width: SizeConfig.screenWidth * 0.6,
                        child: Text(
                          "Login dengan Nomor Telepon \nyang sudah terdaftar.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: getProportionateScreenHeight(18),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.02,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.3,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFormField(
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty) {
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
                                  },
                                );
                              },
                            ),
                            TextFormField(
                              controller: passwordController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty) {
                                  return kPasswordInvalid;
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                labelText: 'Password',
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
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    // INI BUAT CUSTOM ERROR TEXT
                    // FormError(errors: errors),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(30)),
                      child: const SizedBox(
                        // width: SizeConfig.screenWidth * 0.6,
                        child: Text(
                          'Dengan ketukan “Masuk” anda \nmenyetujui syarat dan ketentuan',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.01,
                    ),
                    RoundedButton(
                        width: SizeConfig.screenWidth * 0.8,
                        text: 'Masuk',
                        press: loginUser
                        // press: () {
                        //   if (_formKey.currentState!.validate()) {
                        //     _formKey.currentState?.save();

                        //     Navigator.pushNamed(
                        //       context,
                        //       HomePage.routeName,
                        //     );
                        //   }
                        // },
                        ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(20)),
                      child: SizedBox(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(text: 'Pengguna Baru? Daftar '),
                              TextSpan(
                                text: 'disini',
                                style: const TextStyle(color: kMainColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                      context,
                                      RegisterScreen.routeName,
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
      Navigator.pushNamed(
        context,
        SuccessScreen.routeName,
      );
      return;
    }

    log(requestLogin['error']);

    // Reiii notes >
    // Kalo kodenya sampe sini, berarti login gagal, kasih error alert atau apalah bebas
    // Nabeel error
    // Variable error message : requestLogin['error']
  }
}
