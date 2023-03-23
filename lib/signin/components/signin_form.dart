import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:th_flutter/Model/ultilities.dart';
import 'package:th_flutter/signup/signuppage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  }

  Future<void> checkIfSaved() async {
    SharedPreferences ref = await SharedPreferences.getInstance();
    if (ref.getString('username') != null) {
      setState(() {
        _username.text = ref.getString('username')!;
        _password.text = ref.getString('password')!;
        _save = true;
      });
    }
  }

  void saveUser() async {
    SharedPreferences ref = await SharedPreferences.getInstance();
    ref.setString('username', _username.text);
    ref.setString('password', _password.text);
  }

  void deleteUser() async {
    SharedPreferences ref = await SharedPreferences.getInstance();
    ref.remove('username');
    ref.remove('password');
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkIfSaved();
    });
    return Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Sign in with your email and password",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
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
                  Checkbox(
                      value: _save,
                      onChanged: ((value) {
                        setState(() {
                          _save = value!;
                        });
                      })),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          onclickLogin(context);
                        }
                      },
                      style: const ButtonStyle(
                        shape:
                            MaterialStatePropertyAll(RoundedRectangleBorder()),
                        backgroundColor: MaterialStatePropertyAll(Colors.green),
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
                  const SizedBox(height: 50),
                  const Text(
                    "Or continue with social media",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green),
                  ),
                  const SizedBox(height: 50),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have account ?",
                        style: TextStyle(color: Colors.green, fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () async {
                          Navigator.pushNamed(context, SignUpPage.routeName)
                              .then((value) {
                            if (value != null) {
                              MyUser user = value as MyUser;
                              _username.text = user.email;
                              _password.text = user.pass;
                            }
                          });
                        },
                        child: const Text(
                          "Sign up",
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 14),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  void onclickLogin(BuildContext context) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _username.text, password: _password.text);
      if (credential.user != null && mounted) {
        if (_save) {
          saveUser();
        } else {
          deleteUser();
        }
        Navigator.pushNamed(context, HomePage.routeName);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$e')),
        );
      }
    }
  }

//   invalid-email:
// Thrown if the email address is not valid.
// user-disabled:
// Thrown if the user corresponding to the given email has been disabled.
// user-not-found:
// Thrown if there is no user corresponding to the given email.
// wrong-password:
// Thrown if the password is invalid for the given email, or the account corresponding to the email does not have a password set.
}
