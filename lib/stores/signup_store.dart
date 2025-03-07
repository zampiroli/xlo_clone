import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_clone/helpers/extension.dart';
import 'package:xlo_clone/models/user.dart';
import 'package:xlo_clone/repositories/user_repository.dart';
import 'package:xlo_clone/stores/user_manager_store.dart';
part 'signup_store.g.dart';

class SignupStore = _SignupStoreBase with _$SignupStore;

abstract class _SignupStoreBase with Store {
  //Validação apelido
  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name.length > 6;
  String get nameError {
    if (name == null || nameValid)
      return null;
    else if (name == null || name.isEmpty)
      return 'Campo obrigatório!';
    else
      return 'Nome muito curto.';
  }

  //Validação email
  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError {
    if (email == null || emailValid)
      return null;
    else if (email.isEmpty)
      return 'Campo obrigatório';
    else
      return 'E-mail inválido';
  }

  //Validação telefone
  @observable
  String phone;

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone.length >= 14;
  String get phoneError {
    if (phone == null || phoneValid)
      return null;
    else if (phone.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Celular inválido';
  }

  //Validação Senha
  @observable
  String pass1;

  @action
  void setPass1(String value) => pass1 = value;

  @computed
  bool get pass1Valid => pass1 != null && pass1.length >= 6;
  String get pass1Error {
    if (pass1 == null || pass1Valid)
      return null;
    else if (pass1.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Senha muito curta';
  }

  //Validação confirmação de senha
  @observable
  String pass2;

  @action
  void setPass2(String value) => pass2 = value;

  @computed
  bool get pass2Valid => pass2 != null && pass2 == pass1;
  String get pass2Error {
    if (pass2 == null || pass2Valid)
      return null;
    else
      return 'As senhas não coincidem';
  }

  @computed
  bool get isFormValid =>
      nameValid && emailValid && phoneValid && pass1Valid && pass2Valid;

  @computed
  Function get signupPressed => (isFormValid && !loading) ? _signUp : null;

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  Future<void> _signUp() async {
    loading = true;
    final user = User(
      name: name,
      email: email,
      phone: phone,
      password: pass1,
    );
    try {
      final resultUser = await UserRepository().signUp(user);
      GetIt.I<UserManagerStore>().setUser(resultUser);
    } catch (e) {
      error = e;
    }

    loading = false;
  }
}
