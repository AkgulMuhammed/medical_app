import 'package:flutter/material.dart';
import 'package:flutter_medical_app/constants/const.dart';
import 'package:flutter_medical_app/fakeApi/fake_api.dart';

import 'package:flutter_medical_app/views/main_page.dart';
import 'package:flutter_medical_app/views/signup_page.dart';
import 'package:flutter_medical_app/views/widgets/signformtextfield.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    MedicalConst.loginPageImage,
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                ],
              ),
              Text(
                'Welcome back!',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text(
                'Log in to your existent account of Q Allure',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: Colors.black45),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      SignFormTextField(
                        icon: Icon(Icons.person),
                        hintText: 'User name',
                        name: _username,
                        enableSuggestions: true,
                        isPassword: false,
                        textInputType: TextInputType.text,
                        validator: RequiredValidator(
                            errorText: 'Kullanıcı İsmi Girmeniz Gereklidir'),
                      ),
                      SignFormTextField(
                        icon: Icon(Icons.lock_outline_rounded),
                        hintText: 'Password',
                        name: _password,
                        enableSuggestions: false,
                        isPassword: true,
                        textInputType: TextInputType.number,
                        validator: MultiValidator([
                          MaxLengthValidator(10,
                              errorText:
                                  'Şifreniz 10 karekterden daha olmamalıdır'),
                          RequiredValidator(
                              errorText: 'Şifre girmeniz gerekli'),
                          MinLengthValidator(5,
                              errorText:
                                  'Şifreniz en az 5 karakter olmalıdır.'),
                        ]),
                      ),
                      _forgotPassword(),
                      LoginButton(
                          formkey: _formkey,
                          username: _username,
                          password: _password),
                      const SizedBox(height: 20),
                      _connectUsingText(context),
                      const SizedBox(height: 20),
                      _socialButtons(),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(color: Colors.blue),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _socialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButtonSocial(
            icon: const Icon(Icons.facebook),
            text: 'Facebook',
            color: Colors.blue.shade800),
        ElevatedButtonSocial(
            icon: const Icon(Icons.mail_outlined),
            text: 'Google',
            color: Colors.red.shade800),
      ],
    );
  }

  Center _connectUsingText(BuildContext context) {
    return Center(
        child: Text(
      'Or connect using',
      style:
          Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.grey),
    ));
  }

  Row _forgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          child: const Text('Forgot password?'),
          onPressed: () {},
        )
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required GlobalKey<FormState> formkey,
    required TextEditingController username,
    required TextEditingController password,
  })  : _formkey = formkey,
        _username = username,
        _password = password,
        super(key: key);

  final GlobalKey<FormState> _formkey;
  final TextEditingController _username;
  final TextEditingController _password;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade900,
            fixedSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        child: const Text(
          'LOG IN',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          if (_formkey.currentState!.validate()) {
            _formkey.currentState?.save();
            if (FakeLoginApi.fakelogin(
                username: _username.text, password: _password.text)) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: ((context) => const MainPage())));
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Alert"),
                    content: const Text("Kullanıcı Adı veya Şifre Hatalıdır"),
                    actions: <Widget>[
                      ElevatedButton(
                        style: const ButtonStyle(),
                        child: const Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}

class ElevatedButtonSocial extends StatelessWidget {
  const ElevatedButtonSocial({
    Key? key,
    required this.text,
    required this.color,
    required this.icon,
  }) : super(key: key);
  final String text;
  final Color color;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: ElevatedButton.icon(
        icon: icon,
        label: Text(text),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            fixedSize: const Size.fromHeight(40),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}
