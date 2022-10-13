import 'package:flutter/material.dart';
import 'package:flutter_medical_app/views/login_page.dart';
import 'package:flutter_medical_app/views/widgets/signformtextfield.dart';
import 'package:form_field_validator/form_field_validator.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordconfirm = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _backArrow(context),
            Center(
                child: Text(
              "Let's Get Started!",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            )),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Create an account to Q Allure to get all features',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: Colors.grey),
              ),
            ),
            Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    SignFormTextField(
                      icon: Icon(Icons.person),
                      hintText: 'User Name',
                      name: _username,
                      enableSuggestions: true,
                      isPassword: false,
                      textInputType: TextInputType.name,
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Check UserName'),
                      ]),
                    ),
                    SignFormTextField(
                      icon: Icon(Icons.mail),
                      hintText: 'Email',
                      name: _email,
                      enableSuggestions: true,
                      isPassword: false,
                      textInputType: TextInputType.emailAddress,
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Check Email'),
                      ]),
                    ),
                    SignFormTextField(
                      icon: Icon(Icons.phone),
                      hintText: 'Phone',
                      name: _phone,
                      enableSuggestions: true,
                      isPassword: false,
                      textInputType: TextInputType.number,
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'check number'),
                      ]),
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
                        RequiredValidator(errorText: 'Check Password'),
                        MinLengthValidator(5,
                            errorText: 'Şifreniz en az 5 karakter olmalıdır.'),
                      ]),
                    ),
                    SignFormTextField(
                      icon: Icon(Icons.lock_outline_rounded),
                      hintText: 'Password Confirm',
                      name: _passwordconfirm,
                      enableSuggestions: false,
                      isPassword: true,
                      textInputType: TextInputType.number,
                      validator: MultiValidator([
                        MaxLengthValidator(10,
                            errorText:
                                'Şifreniz 10 karekterden daha olmamalıdır'),
                        RequiredValidator(errorText: 'Check Password'),
                        MinLengthValidator(5,
                            errorText: 'Şifreniz en az 5 karakter olmalıdır.'),
                      ]),
                    ),
                    SizedBox(height: 10),
                    SignUpButton(
                        formkey: _formkey,
                        username: _username,
                        email: _email,
                        phone: _phone,
                        password: _password,
                        passwordconfirm: _passwordconfirm),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                            },
                            child: const Text(
                              'Login Here',
                              style: TextStyle(color: Colors.blue),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Padding _backArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: Icon(
            Icons.arrow_back,
            size: 28,
          )),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
    required GlobalKey<FormState> formkey,
    required TextEditingController username,
    required TextEditingController email,
    required TextEditingController phone,
    required TextEditingController password,
    required TextEditingController passwordconfirm,
  })  : _formkey = formkey,
        _username = username,
        _email = email,
        _phone = phone,
        _password = password,
        _passwordconfirm = passwordconfirm,
        super(key: key);

  final GlobalKey<FormState> _formkey;
  final TextEditingController _username;
  final TextEditingController _email;
  final TextEditingController _phone;
  final TextEditingController _password;
  final TextEditingController _passwordconfirm;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade700,
            fixedSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        child: const Text(
          'CREATE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          if (_formkey.currentState!.validate()) {
            _formkey.currentState?.save();
            debugPrint(
                'user name : $_username, Email : $_email, Phone : $_phone Password : $_password Password Confirm : $_passwordconfirm');
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Alert"),
                  content: const Text(
                      "Your Registration Has Been Successfully Received"),
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
        },
      ),
    );
  }
}
