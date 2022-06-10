// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerStore on _ControllerStoreBase, Store {
  late final _$emailAtom =
      Atom(name: '_ControllerStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_ControllerStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$passwordVisibleAtom =
      Atom(name: '_ControllerStoreBase.passwordVisible', context: context);

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.reportRead();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.reportWrite(value, super.passwordVisible, () {
      super.passwordVisible = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_ControllerStoreBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$eventNameAtom =
      Atom(name: '_ControllerStoreBase.eventName', context: context);

  @override
  String get eventName {
    _$eventNameAtom.reportRead();
    return super.eventName;
  }

  @override
  set eventName(String value) {
    _$eventNameAtom.reportWrite(value, super.eventName, () {
      super.eventName = value;
    });
  }

  late final _$eventDescriptionAtom =
      Atom(name: '_ControllerStoreBase.eventDescription', context: context);

  @override
  String get eventDescription {
    _$eventDescriptionAtom.reportRead();
    return super.eventDescription;
  }

  @override
  set eventDescription(String value) {
    _$eventDescriptionAtom.reportWrite(value, super.eventDescription, () {
      super.eventDescription = value;
    });
  }

  late final _$dateAtom =
      Atom(name: '_ControllerStoreBase.date', context: context);

  @override
  String get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(String value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  late final _$startTimeAtom =
      Atom(name: '_ControllerStoreBase.startTime', context: context);

  @override
  String get startTime {
    _$startTimeAtom.reportRead();
    return super.startTime;
  }

  @override
  set startTime(String value) {
    _$startTimeAtom.reportWrite(value, super.startTime, () {
      super.startTime = value;
    });
  }

  late final _$endTimeAtom =
      Atom(name: '_ControllerStoreBase.endTime', context: context);

  @override
  String get endTime {
    _$endTimeAtom.reportRead();
    return super.endTime;
  }

  @override
  set endTime(String value) {
    _$endTimeAtom.reportWrite(value, super.endTime, () {
      super.endTime = value;
    });
  }

  late final _$cepAtom =
      Atom(name: '_ControllerStoreBase.cep', context: context);

  @override
  String get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  late final _$streetAtom =
      Atom(name: '_ControllerStoreBase.street', context: context);

  @override
  String get street {
    _$streetAtom.reportRead();
    return super.street;
  }

  @override
  set street(String value) {
    _$streetAtom.reportWrite(value, super.street, () {
      super.street = value;
    });
  }

  late final _$numberAtom =
      Atom(name: '_ControllerStoreBase.number', context: context);

  @override
  String get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(String value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  late final _$neighborhoodAtom =
      Atom(name: '_ControllerStoreBase.neighborhood', context: context);

  @override
  String get neighborhood {
    _$neighborhoodAtom.reportRead();
    return super.neighborhood;
  }

  @override
  set neighborhood(String value) {
    _$neighborhoodAtom.reportWrite(value, super.neighborhood, () {
      super.neighborhood = value;
    });
  }

  late final _$cityAtom =
      Atom(name: '_ControllerStoreBase.city', context: context);

  @override
  String get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  late final _$eventListAtom =
      Atom(name: '_ControllerStoreBase.eventList', context: context);

  @override
  List<EventModel> get eventList {
    _$eventListAtom.reportRead();
    return super.eventList;
  }

  @override
  set eventList(List<EventModel> value) {
    _$eventListAtom.reportWrite(value, super.eventList, () {
      super.eventList = value;
    });
  }

  late final _$initialLoadAsyncAction =
      AsyncAction('_ControllerStoreBase.initialLoad', context: context);

  @override
  Future<void> initialLoad() {
    return _$initialLoadAsyncAction.run(() => super.initialLoad());
  }

  late final _$loginUserAsyncAction =
      AsyncAction('_ControllerStoreBase.loginUser', context: context);

  @override
  Future<void> loginUser({required String email, required String password}) {
    return _$loginUserAsyncAction
        .run(() => super.loginUser(email: email, password: password));
  }

  late final _$logOutUserAsyncAction =
      AsyncAction('_ControllerStoreBase.logOutUser', context: context);

  @override
  Future<void> logOutUser() {
    return _$logOutUserAsyncAction.run(() => super.logOutUser());
  }

  late final _$splashInitAsyncAction =
      AsyncAction('_ControllerStoreBase.splashInit', context: context);

  @override
  Future<void> splashInit() {
    return _$splashInitAsyncAction.run(() => super.splashInit());
  }

  late final _$_ControllerStoreBaseActionController =
      ActionController(name: '_ControllerStoreBase', context: context);

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsVisible(bool value) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.setIsVisible');
    try {
      return super.setIsVisible(value);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEventName(String value) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.setEventName');
    try {
      return super.setEventName(value);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEventDescription(String value) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.setEventDescription');
    try {
      return super.setEventDescription(value);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDate(String value) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.setDate');
    try {
      return super.setDate(value);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStartTime(String value) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.setStartTime');
    try {
      return super.setStartTime(value);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEndTime(String value) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.setEndTime');
    try {
      return super.setEndTime(value);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCep(String value) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.setCep');
    try {
      return super.setCep(value);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStreet(String value) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.setStreet');
    try {
      return super.setStreet(value);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNumber(String value) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.setNumber');
    try {
      return super.setNumber(value);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNeighborhood(String value) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.setNeighborhood');
    try {
      return super.setNeighborhood(value);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCity(String value) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.setCity');
    try {
      return super.setCity(value);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validadeFields() {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.validadeFields');
    try {
      return super.validadeFields();
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
passwordVisible: ${passwordVisible},
errorMessage: ${errorMessage},
eventName: ${eventName},
eventDescription: ${eventDescription},
date: ${date},
startTime: ${startTime},
endTime: ${endTime},
cep: ${cep},
street: ${street},
number: ${number},
neighborhood: ${neighborhood},
city: ${city},
eventList: ${eventList}
    ''';
  }
}
