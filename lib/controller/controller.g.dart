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
  String toString() {
    return '''
email: ${email},
password: ${password},
passwordVisible: ${passwordVisible},
errorMessage: ${errorMessage}
    ''';
  }
}
