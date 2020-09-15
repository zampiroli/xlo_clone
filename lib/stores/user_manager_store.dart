import 'package:mobx/mobx.dart';
import 'package:xlo_clone/models/user.dart';
import 'package:xlo_clone/repositories/user_repository.dart';

part 'user_manager_store.g.dart';

class UserManagerStore = _UserManagerStoreBase with _$UserManagerStore;

abstract class _UserManagerStoreBase with Store {
  _UserManagerStoreBase() {
    _getCurrentUser();
  }

  @observable
  User user;
  @action
  void setUser(User value) => user = value;
  @computed
  bool get isLogedIn => user != null;

  Future<void> _getCurrentUser() async {
    final user = await UserRepository().currentUser();
    setUser(user);
  }

  Future<void> logoutUser() async {
    final response = await UserRepository().userLogout();
  }
}
