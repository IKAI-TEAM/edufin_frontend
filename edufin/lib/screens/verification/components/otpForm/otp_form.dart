import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpForm extends StatefulWidget {
  final ValueSetter<List<dynamic>> onOtpFormComplete;

  const OtpForm({Key? key, required this.onOtpFormComplete}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final List<dynamic> otpCode = List.generate(4, (index) => null);
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].addListener(() {
        if (i > 0) {
          if (_focusNodes[i].hasFocus) {
            if (otpCode[i - 1] == null) {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            }
          }
        }
      });
    }
  }

  void _onPinChanged(int index, String value) {
    if (value.length == 1) {
      otpCode[index] = int.parse(value);

      if (index < 3) {
        FocusScope.of(context).nextFocus();
      }
    } else {
      if (index > 0) {
        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
      }
      otpCode[index] = null;
    }
    widget.onOtpFormComplete(otpCode);
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var i = 0; i < 4; i++)
          SizedBox(
            height: getProportionateScreenHeight(65),
            width: getProportionateScreenWidth(64),
            child: TextFormField(
              focusNode: _focusNodes[i],
              controller: _controllers[i],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '';
                }
                return null;
              },
              onChanged: (value) => _onPinChanged(i, value),
              style: Theme.of(context).textTheme.titleLarge,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
      ],
    );
  }
}
