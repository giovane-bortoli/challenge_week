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

  @observable
  bool isSaved = false;

  @action
  void setIsSaved(bool value) {
    isSaved = value;
  }

  @action
  setEventName(String value) {
    eventName = value;
    setIsSaved(false);
  }

  @action
  setEventDescription(String value) {
    eventDescription = value;
    setIsSaved(false);
  }

  @action
  setDate(String value) {
    date = value;
    setIsSaved(false);
  }

  @action
  setStartTime(String value) {
    startTime = value;
    setIsSaved(false);
  }

  @action
  setEndTime(String value) {
    endTime = value;
    setIsSaved(false);
  }

  @action
  setCep(String value) {
    cep = value;
    setIsSaved(false);
  }

  @action
  setStreet(String value) {
    street = value;
    setIsSaved(false);
  }

  @action
  setNumber(String value) {
    number = value;
    setIsSaved(false);
  }

  @action
  setNeighborhood(String value) {
    neighborhood = value;
    setIsSaved(false);
  }

  @action
  setCity(String value) {
    city = value;
    setIsSaved(false);
  }

  @observable
  bool googleMapController = false;
  @action
  void setGoogleMapController(bool value) {
    googleMapController = value;
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

  @action
  Future<void> logOutUser() async {
    await clientDatabase.logOutFirebase();
  }

  // @action
  // Future<void> userAlreadyLogged() async {
  //   await clientDatabase.firebaseAlreadyLogin();
  // }

  //Splash screen
  @action
  Future<void> splashInit() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    FlutterNativeSplash.remove();
    clientDatabase.firebaseAlreadyLogin();
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

  // @action
  // Future<void> saveData(EventModel event) async {
  //   await prefs.saveData(event);
  // }

  @action
  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('event_name', eventName);
    await prefs.setString('event_description', eventDescription);
    await prefs.setString('start_time', startTime);
    await prefs.setString('end_time', endTime);
    await prefs.setString('cep', cep);
    await prefs.setString('street', street);
    await prefs.setString('number', number);
    await prefs.setString('neighborhood', neighborhood);
    await prefs.setString('city', city);
    setIsSaved(true);
  }

  @action
  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getString('event_name');
    prefs.getString('event_description');
    prefs.getString('start_time');
    prefs.getString('end_time');
    prefs.getString('cep');
    prefs.getString('street');
    prefs.getString('number');
    prefs.getString('neighborhood');
    prefs.getString('city');
  }

  @computed
  bool get validEvent =>
      eventName.isNotEmpty &&
      eventDescription.isNotEmpty &&
      startTime.isNotEmpty &&
      endTime.isNotEmpty &&
      cep.isNotEmpty &&
      street.isNotEmpty &&
      number.isNotEmpty &&
      neighborhood.isNotEmpty &&
      city.isNotEmpty;
}
