import 'package:Challenge_App/services/database.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class ControllerStore = _ControllerStoreBase with _$ControllerStore;

abstract class _ControllerStoreBase with Store {
  final clientDatabase = ClientDatabase();

  //Database - Login
  @observable
  String email = '';

  @observable
  String password = '';

//event Register

  @action
  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      await clientDatabase.loginFirebase(email: email, password: password);
    } catch (e) {
      if (e == 'user-not-found') {
        throw e;
      }
      if (e == 'invalid-email') {
        throw e;
      } else {
        throw e;
      }
    }
  }

  @action
  Future<void> logOutUser() async {
    await clientDatabase.logOutFirebase();
  }
}
