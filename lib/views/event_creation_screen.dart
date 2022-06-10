import 'package:Challenge_App/components/text_form_field.dart';
import 'package:Challenge_App/models/event_model.dart';
import 'package:Challenge_App/services/prefs.dart';

import 'package:Challenge_App/shared/utils/app_colors.dart';
import 'package:Challenge_App/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventCreationScreen extends StatefulWidget {
  const EventCreationScreen({Key? key}) : super(key: key);

  @override
  State<EventCreationScreen> createState() => _EventCreationScreenState();
}

class _EventCreationScreenState extends State<EventCreationScreen> {
  Prefs prefs = Prefs();
  EventModel? event;

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
      body: SingleChildScrollView(
        child: Column(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 220, bottom: 10),
              child: Text(
                'Informações do evento',
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 240),
              child: Text(
                'Nome do evento',
                style: GoogleFonts.montserrat(fontSize: 14),
              ),
            ),
            TxtForm(
              onChange: (String value) {
                controller.setEventName(value);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 220, top: 10),
              child: Text('Descrição do evento',
                  style: GoogleFonts.montserrat(fontSize: 14)),
            ),
            TxtForm(onChange: (String value) {
              controller.setEventDescription(value);
            }),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TxtForm(
                      hintText: '\  / \      \ / ',
                      onChange: (String value) {
                        controller.setDate(value);
                      },
                    ),
                  ),
                  Expanded(
                    child: TxtForm(
                      hintText: '00:00',
                      onChange: (String value) {
                        controller.setStartTime(value);
                      },
                    ),
                  ),
                  Expanded(
                    child: TxtForm(
                      hintText: '00:00',
                      onChange: (String value) {
                        controller.setEndTime(value);
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 230, top: 20),
              child: Text(
                'Informações do local',
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 320, top: 10),
              child: Text(
                'CEP',
                style: GoogleFonts.montserrat(fontSize: 14),
              ),
            ),
            TxtForm(
              onChange: (String value) {
                controller.setCep(value);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 320, top: 10),
              child: Text(
                'Rua',
                style: GoogleFonts.montserrat(fontSize: 14),
              ),
            ),
            TxtForm(
              onChange: (String value) {
                controller.setStreet(value);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 305, top: 10),
              child: Text(
                'Bairro',
                style: GoogleFonts.montserrat(fontSize: 14),
              ),
            ),
            TxtForm(
              onChange: (String value) {
                controller.setNeighborhood(value);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 300, top: 10),
              child: Text(
                'Número',
                style: GoogleFonts.montserrat(fontSize: 14),
              ),
            ),
            TxtForm(
              onChange: (String value) {
                controller.setNumber(value);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 310, top: 10),
              child: Text(
                'Cidade',
                style: GoogleFonts.montserrat(fontSize: 14),
              ),
            ),
            TxtForm(
              onChange: (String value) {
                controller.setCity(value);
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    AppColors.deepPurpleSwatch.shade400),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              onPressed: () async {
                event != null
                    ? controller.saveData(event!)
                    : const Text('salvo');
              },
              child: Text(
                'Adicionar evento',
                style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget saveDataButton(EventModel event) {
  //   return ElevatedButton(
  //     onPressed: () async {
  //       await Prefs().saveData(event);
  //     },
  //     child: const Text('Save'),
  //   );
  // }
}
