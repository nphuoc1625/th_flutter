import 'package:flutter/cupertino.dart';

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
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.bottomRight,
      child: Image.asset("dish.png"),
    );
  }
  Widget footerScreen(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.bottomRight,
      child: Image.asset("dish_2.png"),

    );
  }
}
