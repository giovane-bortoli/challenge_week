import 'package:Challenge_App/shared/theme/font_theme.dart';
import 'package:flutter/material.dart';

class TxtForm extends StatefulWidget {
  final String labelText;
  final Function(String) onChange;

  const TxtForm({
    Key? key,
    required this.labelText,
    required this.onChange,
  }) : super(key: key);

  @override
  State<TxtForm> createState() => _TxtFormState();
}

class _TxtFormState extends State<TxtForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      decoration: InputDecoration(
        labelText: widget.labelText,
        filled: true,
        fillColor: Colors.white,
      ),
      onChanged: widget.onChange,
    );
  }
}
