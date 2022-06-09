import 'package:Challenge_App/controller/controller.dart';
import 'package:Challenge_App/models/event_model.dart';
import 'package:Challenge_App/services/api.dart';
import 'package:Challenge_App/shared/theme/font_theme.dart';
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
        body: Observer(builder: (context) {
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
      ),
    );
  }

  Widget cardEvent(EventModel event) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(16),
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
