import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../DBHelper/userdb.dart';
import 'package:th_flutter/Model/ultilities.dart';
import 'package:th_flutter/signup/signuppage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/user.dart';
import '../../homepage/homepage.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formkey = GlobalKey<FormState>();
  bool value = false;

  final _username = TextEditingController();
  final _password = TextEditingController();
  var _save = false;

  @override
  void initState() {
    super.initState();
    checkIfSaved().then((value) => value ? login(context) : {});
  }

  Future<bool> checkIfSaved() async {
    SharedPreferences ref = await SharedPreferences.getInstance();
    if (ref.getString('username') != null) {
      setState(() {
        _username.text = ref.getString('username')!;
        _password.text = ref.getString('password')!;
        _save = true;
      });
      return true;
    }
    return false;
  }

  void saveUser() async {
    SharedPreferences ref = await SharedPreferences.getInstance();
    ref.setString('username', _username.text);
    ref.setString('password', _password.text);
  }

  void deleteUser() async {
    SharedPreferences ref = await SharedPreferences.getInstance();
    if (ref.getString('username') != null) {
      ref.remove('username');
      ref.remove('password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Food now",
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sign in with your email and password",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                TextFormField(
                  validator: (value) {
                    return Ultilites.validateEmail(_username.text);
                  },
                  onSaved: (newValue) {},
                  controller: _username,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Username",
                      prefixIcon: Icon(Icons.mail)),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _password,
                  validator: (value) {
                    return Ultilites.validatePassword(_password.text);
                  },
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Password Number",
                      prefixIcon: Icon(Icons.password_outlined)),
                ),
                const SizedBox(height: 5),
                Row(children: [
                  Checkbox(
                      value: _save,
                      onChanged: ((value) {
                        setState(() {
                          _save = value!;
                        });
                      })),
                  const Text('Save identical')
                ]),
                const SizedBox(height: 5),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        login(context);
                      }
                    },
                    style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder()),
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Or continue with social media",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                      child: SvgPicture.asset("assets/icons/facebook.svg"),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                      child: SvgPicture.asset("assets/icons/google.svg"),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                      child: SvgPicture.asset("assets/icons/twitter.svg"),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    "Don't have account ?",
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                  GestureDetector(
                      onTap: () async {
                        Navigator.pushNamed(context, SignUpPage.routeName)
                            .then((value) {
                          if (value != null) {
                            var user = value as List<String>;
                            _username.text = user[0];
                            _password.text = user[1];
                          }
                        });
                      },
                      child: const Text("Sign up",
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 14)))
                ])
              ]))
        ]));
  }

  void login(BuildContext context) {
    MyUser user = MyUser(_username.text, _password.text);
    UserDB.signIn(user).then((value) {
      if (value == null) {
        if (_save) {
          saveUser();
        } else {
          deleteUser();
        }
        Navigator.pushNamed(context, HomePage.routeName);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value)));
      }
    });
  }
}
