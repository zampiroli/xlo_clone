import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_clone/screens/singup/components/field_title.dart';
import 'package:xlo_clone/stores/signup_store.dart';

class SingUpScreen extends StatelessWidget {
  final SignupStore signupStore = SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16, top: 8),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FieldTitle(
                      title: 'Apelido',
                      subtitle: 'Como aparecerá em seus anúncios.',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          hintText: 'Exemplo: João S.',
                          errorText: signupStore.nameError,
                        ),
                        onChanged: signupStore.setName,
                      );
                    }),
                    const SizedBox(height: 16),
                    FieldTitle(
                      title: 'E-mail',
                      subtitle: 'Enviaremos um e-mail de confirmação.',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          hintText: 'Exemplo: joao@gmail.com',
                          errorText: signupStore.emailError,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        onChanged: signupStore.setEmail,
                      );
                    }),
                    const SizedBox(height: 16),
                    FieldTitle(
                      title: 'Celular',
                      subtitle: 'Proteja sua conta',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          hintText: 'Exemplo: (99) 99999-9999',
                          errorText: signupStore.phoneError,
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          // ignore: deprecated_member_use
                          WhitelistingTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter()
                        ],
                        onChanged: signupStore.setPhone,
                      );
                    }),
                    const SizedBox(height: 16),
                    FieldTitle(
                      title: 'Senha',
                      subtitle: 'Use letras, números e caracteres especiais.',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          errorText: signupStore.pass1Error,
                        ),
                        obscureText: true,
                        onChanged: signupStore.setPass1,
                      );
                    }),
                    const SizedBox(height: 16),
                    FieldTitle(
                      title: 'Confirmar Senha',
                      subtitle: 'Repita a sua senha.',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          errorText: signupStore.pass2Error,
                        ),
                        obscureText: true,
                        onChanged: signupStore.setPass2,
                      );
                    }),
                    Observer(builder: (_) {
                      return Container(
                        height: 40,
                        margin: const EdgeInsets.only(top: 20, bottom: 12),
                        child: RaisedButton(
                          color: Colors.orange,
                          child: signupStore.loading
                              ? CircularProgressIndicator()
                              : Text('Cadastrar'),
                          textColor: Colors.white,
                          disabledColor: Colors.orange.withAlpha(120),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: signupStore.signupPressed,
                        ),
                      );
                    }),
                    Divider(color: Colors.black),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Já tem uma conta? ',
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: Navigator.of(context).pop,
                            child: Text(
                              'Entrar',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.purple,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
