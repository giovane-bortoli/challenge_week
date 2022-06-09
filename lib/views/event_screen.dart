import 'package:Challenge_App/controller/controller.dart';
import 'package:Challenge_App/models/event_model.dart';
import 'package:Challenge_App/services/api.dart';
import 'package:Challenge_App/shared/theme/font_theme.dart';
import 'package:Challenge_App/shared/utils/app_colors.dart';
import 'package:Challenge_App/shared/utils/app_files.dart';
import 'package:Challenge_App/shared/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                    Navigator.popAndPushNamed(context, '/eventScreen');
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
                  Center(
                    child: Container(
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: controller.eventList.length,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return cardEvent(controller.eventList[index]);
                        },
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    child: const Text('teste'),
                  ),
                ],
              );
            }),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                margin: const EdgeInsets.only(left: 50, right: 50),
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
      onTap: () {},
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SvgPicture.asset(AppImages.cardImage),
            Text(event.eventName, style: CustomTextTheme.textTheme.subtitle2),
            Text(event.eventDescription,
                style: CustomTextTheme.textTheme.caption),
            Text(
              '${event.startTime} - ${event.endTime}',
              style: CustomTextTheme.textTheme.overline,
            ),
          ],
        ),
      ),
    );
  }
}
