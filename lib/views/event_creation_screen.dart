import 'package:Challenge_App/components/text_form_field.dart';
import 'package:Challenge_App/shared/utils/app_colors.dart';
import 'package:Challenge_App/views/login_screen.dart';
import 'package:flutter/material.dart';

class EventCreationScreen extends StatefulWidget {
  const EventCreationScreen({Key? key}) : super(key: key);

  @override
  State<EventCreationScreen> createState() => _EventCreationScreenState();
}

class _EventCreationScreenState extends State<EventCreationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.deepPurpleSwatch.shade300,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        centerTitle: true,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/eventScreen');
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              const Padding(
                padding: EdgeInsets.all(60),
                child: Text(
                  'Adicionar evento',
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Nome do evento'),
          ),
          TxtForm(
              labelText: 'Cidade',
              onChange: (String value) {
                controller.setCity(value);
              })
        ],
      ),
    );
  }
}
