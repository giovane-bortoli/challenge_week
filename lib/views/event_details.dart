import 'package:Challenge_App/controller/controller.dart';
import 'package:Challenge_App/models/event_model.dart';
import 'package:Challenge_App/shared/utils/app_colors.dart';
import 'package:Challenge_App/shared/utils/app_files.dart';
import 'package:Challenge_App/shared/utils/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({Key? key}) : super(key: key);

  static const routeName = '/eventDetails';

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  ControllerStore controller = ControllerStore();

  @override
  void initState() {
    controller.initialLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final eventInfo = ModalRoute.of(context)!.settings.arguments as EventModel;

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
                  controller.logOutUser();
                  Navigator.popAndPushNamed(context, '/eventScreen');
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  'Detalhes do evento',
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        ),
      ),
      //child: Text(eventInfo.eventName),
      body: Observer(
        builder: (context) {
          return Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppImages.cardImage,
                      width: 500,
                    ),
                    Text(
                      eventInfo.eventName,
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        eventInfo.eventDescription,
                        style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: [
                          Text(
                            'data',
                            style: GoogleFonts.montserrat(fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 150.0),
                            child: Text(
                              'Horário',
                              style: GoogleFonts.montserrat(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          formatDate(
                            DateTime.parse(eventInfo.startTime),
                          ),
                          style: const TextStyle(color: Colors.amber),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 158),
                          child: Text(
                            formatDate(
                              DateTime.parse(eventInfo.startTime),
                            ),
                            style: const TextStyle(color: Colors.amber),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppImages.mapImageIcon),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                                '${eventInfo.address.street}, ${eventInfo.address.number}, ${eventInfo.address.city} ${eventInfo.address.uf}'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.popAndPushNamed(
                                context,
                                '/eventDetailsMap',
                              );
                            },
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                            child: const Text('Ver no mapa'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
