import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Form(child: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding:const EdgeInsets.all(8),
            alignment:  Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:const [
                Text("Food now",style: TextStyle(fontSize: 32,color: Colors.green,fontWeight: FontWeight.bold),),
                Text("Sign in with your email and password \n or continue with social media",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green),),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(16),
          child: Container(
            child: Column(
              children: [
                TextFormField()
              ],
            ),
          ),)
        ],
      ),
    ));
  }
}
