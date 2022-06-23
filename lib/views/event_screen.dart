import 'package:Challenge_App/controller/controller.dart';
import 'package:Challenge_App/models/event_model.dart';
import 'package:Challenge_App/services/api.dart';
import 'package:Challenge_App/shared/theme/font_theme.dart';
import 'package:Challenge_App/shared/utils/app_colors.dart';
import 'package:Challenge_App/shared/utils/app_files.dart';
import 'package:Challenge_App/shared/utils/app_strings.dart';
import 'package:Challenge_App/shared/utils/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  EventModel? event;
  ControllerStore controller = ControllerStore();

  @override
  void initState() {
    controller.initialLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                    Navigator.popAndPushNamed(context, '/login');
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                const Padding(
                  padding: EdgeInsets.all(110),
                  child: Text(
                    'Eventos',
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: AppStrings.tabLeft,
              ),
              Tab(
                text: AppStrings.tabRight,
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            Observer(builder: (context) {
              return TabBarView(
                children: [
                  Row(
                    children: [
                      //date
                      Text(
                        formatDateRowEventScreen(
                          DateTime.parse(event!.startTime),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 32, bottom: 50),
                        child: customDivider(),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: controller.eventList.length,
                            physics: const ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return cardEvent(controller.eventList[index]);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(color: Colors.white, child: const Text('teste')),
                ],
              );
            }),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                margin: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            AppColors.deepPurpleSwatch.shade400),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/eventCreation');
                      },
                      child: const Text('Criar novo evento')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardEvent(EventModel event) {
    return InkWell(
      onTap: () {
        Navigator.popAndPushNamed(context, '/eventDetails', arguments: event);
      },
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppImages.cardImage,
                width: 500,
              ),
              Text(
                event.eventName,
                style: GoogleFonts.montserrat(fontSize: 18),
                textAlign: TextAlign.left,
              ),
              Text(event.eventDescription,
                  style: GoogleFonts.montserrat(fontSize: 12)),
              Text(
                '${formatDate(DateTime.parse(event.startTime))} - ${formatDate(DateTime.parse(event.endTime))}',
                style:
                    GoogleFonts.montserrat(fontSize: 12, color: Colors.orange),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SvgPicture.asset(AppImages.mapImageIcon),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(event.address.street),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 12),
                ),
                child: const Text('Ver no mapa'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customDivider() {
    return const VerticalDivider(
      color: AppColors.neutralColorLowLight,
      thickness: 3,
    );
  }
}
