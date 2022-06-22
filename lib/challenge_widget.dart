import 'package:Challenge_App/shared/theme/theme_data.dart';
import 'package:Challenge_App/views/event_creation_screen.dart';
import 'package:Challenge_App/views/event_details.dart';
import 'package:Challenge_App/views/event_details_show_map.dart';
import 'package:Challenge_App/views/event_screen.dart';
import 'package:Challenge_App/views/forgotPassword_screen.dart';
import 'package:Challenge_App/views/home_page.dart';
import 'package:Challenge_App/views/login_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemeData.materialTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const MyHomePage(),
        '/forgotPassword': (context) => const ForgotPasswordScreen(),
        '/eventScreen': (context) => const EventScreen(),
        '/eventCreation': (context) => const EventCreationScreen(),
        //'/eventDetails': (context) => const EventDetails()
        EventDetails.routeName: (context) => const EventDetails(),
        EventDetailsMap.routeName: (context) => const EventDetailsMap()
      },
    );
  }
}
