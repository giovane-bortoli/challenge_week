import 'package:Challenge_App/controller/controller.dart';
import 'package:Challenge_App/shared/theme/font_theme.dart';
import 'package:Challenge_App/shared/utils/app_colors.dart';
import 'package:Challenge_App/shared/utils/app_files.dart';
import 'package:Challenge_App/shared/utils/app_strings.dart';
import 'package:Challenge_App/views/login_screen.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  ControllerStore controller = ControllerStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: SvgPicture.asset(AppImages.imageLogin),
                ),
              ),
              Text(
                AppStrings.txtLabel,
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  color: AppColors.deepPurpleSwatch.shade300,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                  height: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 70, left: 64, top: 20),
                child: Text(
                  'Informe seu e-mail para recuperar sua senha',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                width: 350,
                child: TextFormField(
                  style: GoogleFonts.montserrat(fontSize: 16),
                  decoration: const InputDecoration(
                    labelText: AppStrings.txtEmail,
                  ),
                  onChanged: (String value) {
                    controller.setEmail(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SizedBox(
                  width: 350,
                  height: 45,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          AppColors.deepPurpleSwatch.shade400),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {
                      controller.forgotPassword(email: controller.email);

                      if (controller.email.isNotEmpty) {
                        Navigator.popAndPushNamed(context, '/login');
                      }
                    },
                    child: const Text('Enviar'),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }

//Tentativa de implementar flushbar
  void customFlushBar(BuildContext context) {
    Flushbar(
      duration: const Duration(seconds: 3),
      message: 'Seu link de recuperção foi enviado para o e-mail informado',
      icon: const Icon(
        Icons.check,
        color: Colors.green,
      ),
    );
  }
}
