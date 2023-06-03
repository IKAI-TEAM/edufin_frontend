
import 'package:edufin/components/rounded_button.dart';
import 'package:edufin/constants.dart';
import 'package:edufin/models/auth/register_request_model.dart';
import 'package:edufin/screens/login/login_screen.dart';
import 'package:edufin/screens/success/success_screen.dart';
import 'package:edufin/services/api_services.dart';
import 'package:edufin/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  const Register({super.key, required this.text});
  final String text;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  String phoneVal = r'^(\+62|62|0)8[1-9][0-9]{6,9}$';
  String nameVal = r'^[a-z A-Z]+$';

  // String emailVal = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  // String governmentIdVal = r'^(1[1-9]|21|[37][1-6]|5[1-3]|6[1-5]|[89][12])\d{2}\d{2}([04][1-9]|[1256][0-9]|[37][01])(0[1-9]|1[0-2])\d{2}\d{4}$';

  String phoneNum = '';
  String email = '';
  String name = '';
  String governmentId = '';

  bool isValid = false;

  // Texteditor controller for each TextFields
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  TextEditingController governmentIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(45),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  // width: SizeConfig.screenWidth * 0.6,
                  child: Text(
                    "Welcome To \n${widget.text}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenHeight(42),
                      color: kTextColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.03,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.5,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        controller: fullNameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !RegExp(nameVal).hasMatch(value)) {
                            return kNameInvalid;
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Nama Lengkap',
                        ),
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(16),
                          fontWeight: FontWeight.w500,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(30),
                          FilteringTextInputFormatter.singleLineFormatter,
                        ],
                        onChanged: (value) {
                          setState(
                            () {
                              name = value;
                            },
                          );
                        },
                      ),
                      TextFormField(
                        controller: governmentIdController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty ) {
                            return kGovernmentIdInvalid;
                          } else if (value.isNotEmpty && value.length < 16) {
                            return kGovernmentIdTooShort;
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'NIK',
                        ),
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(16),
                          fontWeight: FontWeight.w500,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(16),
                          FilteringTextInputFormatter.singleLineFormatter,
                        ],
                        onChanged: (value) {
                          setState(
                            () {
                              governmentId = value;
                            },
                          );
                        },
                      ),
                      TextFormField(
                        controller: phoneNumberController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty || !RegExp(phoneVal).hasMatch(value)) {
                            return kPhoneInvalid;
                          } else if (value.isNotEmpty && value.length < 11) {
                            return kPhoneTooShort;
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Phone',
                        ),
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(16),
                          fontWeight: FontWeight.w500,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(16),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) {
                          setState(
                            () {
                              phoneNum = value;
                            },
                          );
                        },
                      ),
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
                        ),
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(16),
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
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(10)),
                child: SizedBox(
                  // width: SizeConfig.screenWidth * 0.6,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                            text: 'Dengan ketukan "Daftar" anda \nmenyetujui '),
                        TextSpan(
                          text: 'syarat dan ketentuan',
                          style: const TextStyle(color: kMainColor),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                    style: const TextStyle(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              RoundedButton(
                width: SizeConfig.screenWidth * 0.8,
                text: 'Daftar',
                press: registerUser
                // press: () {
                //   if (_formKey.currentState!.validate()) {
                //     _formKey.currentState?.save();

                //     RegisterRequestModel model = RegisterRequestModel(phoneNumber: int.parse(phoneNum));

                //     APIService.login(model).then((response) => {
                //           if (response)
                //             {
                //               Navigator.pushNamed(
                //                 context,
                //                  VerificationScreen.routeName,
                //                 arguments: {"phone_number": phoneNum},
                //               )
                //             }
                //         });

                //     Navigator.pushNamed(context, SuccessScreen.routeName);
                //   }
                // },
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: getProportionateScreenHeight(16)),
                child: SizedBox(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: 'Sudah Memiliki Akun? Masuk '),
                        TextSpan(
                          text: 'disini',
                          style: const TextStyle(color: kMainColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                context,
                                LoginScreen.routeName,
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
    );
  }

  void registerUser() async {
    
    // Preparing the data
    String fullName = fullNameController.text;
    String email = emailController.text;
    int phoneNumber = int.tryParse(phoneNumberController.text) ?? 0;
    // String password = passwordController.text;
    String governmentId = governmentIdController.text;
    int accountType = 1;

    // Build model
    RegisterRequestModel requestModel = RegisterRequestModel(
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      password: 'Password12345@',
      governmentId: governmentId,
      accountType: accountType,
    );
    // Call the api service
    Map<String, dynamic> requestRegist = await APIService.registerUser(requestModel);

    if(requestRegist['success']) {
      // Navigate to VerificationScreen if success
      Navigator.pushNamed(context, SuccessScreen.routeName);
    }

    // Reiii notes >
    // Kalo kodenya sampe sini, berarti register gagal, kasih error alert atau apalah bebas
    // Nabeel error
    // Variable error message : requestRegist['error']

  }
}

