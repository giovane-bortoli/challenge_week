import 'package:Challenge_App/models/event_model.dart';
import 'package:Challenge_App/services/api.dart';
import 'package:Challenge_App/services/database.dart';
import 'package:Challenge_App/services/prefs.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'controller.g.dart';

class ControllerStore = _ControllerStoreBase with _$ControllerStore;

abstract class _ControllerStoreBase with Store {
  final clientDatabase = ClientDatabase();
  final prefs = Prefs();

  //Database - Login
  @observable
  String email = '';

  @action
  setEmail(String value) {
    email = value;
  }

  @observable
  String password = '';

  @action
  setPassword(String value) {
    password = value;
  }

  @observable
  bool passwordVisible = false;

  @observable
  String errorMessage = '';

  @action
  void setIsVisible(bool value) => passwordVisible = value;

//event Register
  @observable
  String eventName = '';

  @observable
  String eventDescription = '';

  @observable
  String date = '';

  @observable
  String startTime = '';

  @observable
  String endTime = '';

  @observable
  String cep = '';

  @observable
  String street = '';

  @observable
  String number = '';

  @observable
  String neighborhood = '';

  @observable
  String city = '';

  @action
  setEventName(String value) {
    eventName = value;
  }

  @action
  setEventDescription(String value) {
    eventDescription = value;
  }

  @action
  setDate(String value) {
    date = value;
  }

  @action
  setStartTime(String value) {
    startTime = value;
  }

  @action
  setEndTime(String value) {
    endTime = value;
  }

  @action
  setCep(String value) {
    cep = value;
  }

  @action
  setStreet(String value) {
    street = value;
  }

  @action
  setNumber(String value) {
    number = value;
  }

  @action
  setNeighborhood(String value) {
    neighborhood = value;
  }

  @action
  setCity(String value) {
    city = value;
  }

  @observable
  List<EventModel> eventList = [];

  @action
  Future<void> initialLoad() async {
    eventList = await ClientHttp().getEvent();
  }

  @action
  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      await clientDatabase.loginFirebase(email: email, password: password);
    } catch (error) {
      if (error == 'user-not-found') {
        throw error;
      } else {
        throw error;
      }
    }
  }

  Future<void> forgotPassword({required email}) async {
    try {
      await clientDatabase.forgotPasswordFirebase(email: email);
    } catch (e) {
      if (e == 'invalid-email') {
        throw e;
      }
    }
  }

  // @action
  // Future<void> userAlreadyLogged() async {
  //   await clientDatabase.firebaseAlreadyLogin();
  // }

  @action
  Future<void> logOutUser() async {
    await clientDatabase.logOutFirebase();
  }

  //Splash screen
  @action
  Future<void> splashInit() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    FlutterNativeSplash.remove();
  }

  //Validation Fields

  @action
  void validadeFields() {
    if (email.isNotEmpty && email.contains('@.')) {
      if (password.isNotEmpty && password.length > 6) {
        clientDatabase.loginFirebase(email: email, password: password);
      } else {
        errorMessage = 'Preencha os campos corretamente';
      }
    }
  }

  //SavingLocal Data

  @action
  Future<void> saveData(EventModel event) async {
    await prefs.saveData(event);
  }

  // @action
  // Future<void> saveData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('event_name', eventName);
  //   await prefs.setString('event_description', eventDescription);
  //   await prefs.setString('start_time', startTime);
  //   await prefs.setString('end_time', endTime);
  //   await prefs.setString('cep', cep);
  //   await prefs.setString('street', street);
  //   await prefs.setString('number', number);
  //   await prefs.setString('neighborhood', neighborhood);
  //   await prefs.setString('city', city);
  // }
}
