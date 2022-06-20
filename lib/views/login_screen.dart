import 'package:Challenge_App/controller/controller.dart';
import 'package:Challenge_App/services/api.dart';
import 'package:Challenge_App/shared/theme/font_theme.dart';
import 'package:Challenge_App/shared/utils/app_colors.dart';
import 'package:Challenge_App/shared/utils/app_files.dart';
import 'package:Challenge_App/shared/utils/app_strings.dart';
import 'package:Challenge_App/shared/utils/field_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

ClientHttp api = ClientHttp();

ControllerStore controller = ControllerStore();
@override
void initState() {
  //controller.userAlreadyLogged();
  controller.splashInit();
  controller.passwordVisible = false;
}

class _LoginScreenState extends State<LoginScreen> {
  final maskEmail = MaskTextInputFormatter(mask: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 180),
                  child: SvgPicture.asset(AppImages.imageLogin),
                ),
              ),
              Text(
                AppStrings.txtLogin,
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    color: AppColors.deepPurpleSwatch.shade300,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                    height: 1.5),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (String value) {
                    controller.setEmail(value);
                  },
                  validator: FieldValidator().validateEmail,
                  style: GoogleFonts.montserrat(fontSize: 16),
                  decoration: const InputDecoration(
                    labelText: AppStrings.txtEmail,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: TextFormField(
                  onChanged: ((String value) {
                    controller.setPassword(value);
                  }),
                  validator: FieldValidator().validatePasswd,
                  obscureText: !controller.passwordVisible,
                  style: GoogleFonts.montserrat(fontSize: 16),
                  decoration: InputDecoration(
                    labelText: AppStrings.txtPassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        if (controller.passwordVisible == false) {
                          controller.setIsVisible(true);
                        } else {
                          controller.setIsVisible(false);
                        }
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 245),
                child: GestureDetector(
                  child: Text(
                    AppStrings.txtForgotPassword,
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: AppColors.deepPurpleSwatch.shade300),
                  ),
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/forgotPassword');
                    //recovery password method
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
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
                      try {
                        controller
                            .loginUser(
                                email: controller.email,
                                password: controller.password)
                            .then((value) => Navigator.popAndPushNamed(
                                context, '/eventScreen'));
                      } catch (error) {
                        controller.errorMessage = error.toString();
                      }
                    },
                    child: const Text(AppStrings.txtLogin),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

class EmailMask extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (RegExp(r'\w+@\w+\.\w+').hasMatch(newValue.text)) {
      return newValue;
    } else {
      return oldValue;
    }
  }
}
