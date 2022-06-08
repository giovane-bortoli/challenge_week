import 'package:Challenge_App/shared/utils/app_files.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Eventos Soft',
              ),
              Tab(
                text: 'Meus Eventos',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Container(
                color: Colors.white,
                child: SvgPicture.asset(AppImages.backgroundEvent),
              ),
            ),
            Container(
              color: Colors.blue,
              child: Text('tab 2'),
            )
          ],
        ),
      ),
    );
  }
}
