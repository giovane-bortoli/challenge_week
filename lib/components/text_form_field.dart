import 'package:Challenge_App/shared/theme/font_theme.dart';
import 'package:flutter/material.dart';

class TxtForm extends StatefulWidget {
  final String? hintText;
  final Function(String) onChange;

  const TxtForm({
    Key? key,
    required this.onChange,
    this.hintText,
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
