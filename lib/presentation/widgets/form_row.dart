import 'package:flutter/material.dart';
import 'package:flutter_application/core/colors.dart';

class FormRow extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;

  const FormRow({
    Key? key,
    required this.controller,
    required this.labelText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: lightYellow,
          ),
          child: const Icon(
            Icons.lock_open,
            color: honeyYellow,
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor),
              ),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
