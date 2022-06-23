// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pattern_formatter/date_formatter.dart';

import 'package:Challenge_App/shared/theme/font_theme.dart';

class TxtForm extends StatefulWidget {
  final String? hintText;
  final Function(String)? onChange;
  final String? hint;
  final TextInputType? textInputType;
  final FormFieldValidator<String>? validator;

  const TxtForm({
    Key? key,
    this.hintText,
    this.onChange,
    this.hint,
    this.textInputType,
    this.validator,
  }) : super(key: key);

  @override
  State<TxtForm> createState() => _TxtFormState();
}

class _TxtFormState extends State<TxtForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: TextFormField(
        textAlign: TextAlign.start,
        keyboardType: TextInputType.emailAddress,
        autofocus: true,
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: widget.onChange,
      ),
    );
  }
}
