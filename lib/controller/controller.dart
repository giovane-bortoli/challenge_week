import 'package:Challenge_App/services/database.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class ControllerStore = _ControllerStoreBase with _$ControllerStore;

abstract class _ControllerStoreBase with Store {
  final clientDatabase = ClientDatabase();

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

  @action
  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      await clientDatabase.loginFirebase(email: email, password: password);
    } catch (e) {
      if (e == 'user-not-found') {
        throw 'usuário não encontrado';
      } else if (e == 'invalid-email') {
        throw 'Email inválido';
      } else if (e == 'wrong-password') {
        throw 'senha inválida';
      } else {}
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
}
