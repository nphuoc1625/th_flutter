import 'package:flutter/material.dart';
import 'package:th_flutter/DBHelper/userdb.dart';
import 'package:th_flutter/Model/user.dart';

import 'package:firebase_auth/firebase_auth.dart';
import '../../Model/ultilities.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var email = TextEditingController();
  var password = TextEditingController();
  var conformPass = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 30),
              emailTextFormField(),
              const SizedBox(height: 30),
              passwordTextFormField(),
              const SizedBox(height: 30),
              conformTextFormField(),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        onClickRegister(context);
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        shape: const MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))))),
                    child: const Text("Continue",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ));
  }

  emailTextFormField() {
    return TextFormField(
      validator: (value) => Ultilites.validateEmail(value!),
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) {},
      controller: email,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Icon(Icons.mail)),
    );
  }

  passwordTextFormField() {
    return TextFormField(
      key: _passKey,
      validator: (value) => Ultilites.validatePassword(value!),
      obscureText: true,
      keyboardType: TextInputType.number,
      onSaved: (newValue) {},
      controller: password,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Icon(Icons.password)),
    );
  }

  conformTextFormField() {
    return TextFormField(
      validator: (value) {
        String pass = _passKey.currentState!.value;
        return Ultilites.conformPassword(pass, value!);
      },
      keyboardType: TextInputType.number,
      obscureText: true,
      onSaved: (newValue) {},
      controller: conformPass,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Conform password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Icon(Icons.password)),
    );
  }

  onClickRegister(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      MyUser user = MyUser(email.text, password.text);
      UserDB.signUp(user).then((result) {
        if (result == null) {
          Navigator.pop(context, [email.text, password.value]);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(result)));
        }
      });
    }
  }
}
