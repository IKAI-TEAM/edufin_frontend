import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';

class FormError extends StatelessWidget {
  final List<String> errors;
  const FormError({
    super.key,
    required this.errors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length,
        (index) => formErrorText(
          error: errors[index],
        ),
      ),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.red,
        ),
        Padding(
          padding: EdgeInsets.all(getProportionateScreenHeight(6)),
          child: Text(
            error,
            style: TextStyle(
              color: Colors.red,
              fontSize: getProportionateScreenHeight(15),
            ),
          ),
        ),
      ],
    );
  }
}
