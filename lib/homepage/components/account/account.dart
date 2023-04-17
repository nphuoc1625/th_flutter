import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../Model/ultilities.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  var newPassword = TextEditingController();
  var conformPass = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
          key: _formkey,
          child: Column(
            children: [
              passwordTextFormField(),
              const SizedBox(
                height: 20,
              ),
              conformTextFormField(),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      // showDialog(
                      //     context: context,
                      //     builder: (context) =>
                      //         confirmPassworDialog(context)).then((value) {
                      //   // if (value) {
                      //   //   FirebaseAuth.instance.currentUser!
                      //   //       .updatePassword(newPassword.text);
                      //   //   Navigator.pop(context);
                      //   // }
                      // });
                    }
                  },
                  child: const Text("Send code")),
            ],
          )),
    );
  }

  confirmPassworDialog(BuildContext context) {
    final currentPass = TextEditingController();
    final currentPassKey = GlobalKey<FormFieldState>();
    return AlertDialog(
      title: const Text("Enter your current password"),
      content: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "cannot be empty";
          }
          if (value.length <= 8) {
            return "passowrd must longer than 8";
          } else {
            AuthCredential credential = EmailAuthProvider.credential(
                email: FirebaseAuth.instance.currentUser!.email!,
                password: currentPass.text);
            FirebaseAuth.instance.currentUser!
                .reauthenticateWithCredential(credential)
                .then((value) {
              if (value.user != null) {
              } else {
                return "Incorrect pass";
              }
            });
            return null;
          }
        },
        key: currentPassKey,
        controller: currentPass,
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(
            onPressed: () {
              currentPass.dispose();
              Navigator.pop(context);
            },
            child: const Text("Canncel")),
        TextButton(
            onPressed: () {
              if (currentPassKey.currentState!.validate()) {
                currentPass.dispose();
                Navigator.pop(context, true);
              }
            },
            child: const Text("Confirm"))
      ],
    );
  }

  passwordTextFormField() {
    return TextFormField(
      key: _passKey,
      validator: (value) => Ultilites.validatePassword(value!),
      obscureText: true,
      keyboardType: TextInputType.number,
      onSaved: (newValue) {},
      controller: newPassword,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your new password",
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
          hintText: "Conform new password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Icon(Icons.password)),
    );
  }

  onClickRegister(BuildContext context) async {}
}
