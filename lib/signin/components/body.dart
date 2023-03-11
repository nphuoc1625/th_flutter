import 'package:flutter/cupertino.dart';
import 'package:th_flutter/signin/components/signin_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Container(child: Column(children: [
        headerScreen(context),
       SignInForm(),
        footerScreen(context),
      ],),),
    ));
  }
  Widget headerScreen(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.2,
      alignment: Alignment.bottomRight,
      child: Image.asset("assets/dish.png"),
    );
  }
  Widget footerScreen(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.2,
      alignment: Alignment.bottomLeft,
      child: Image.asset("assets/dish_2.png"),

    );
  }
}
