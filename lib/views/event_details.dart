import 'package:Challenge_App/controller/controller.dart';
import 'package:Challenge_App/models/event_model.dart';
import 'package:Challenge_App/shared/utils/app_colors.dart';
import 'package:Challenge_App/shared/utils/app_files.dart';
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
      body: Observer(builder: (context) {
        return Container(
          color: Colors.white,
          child: Text(eventInfo.eventName),
        );
      }),
    );
  }
}
