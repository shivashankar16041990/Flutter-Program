import 'package:flutter/material.dart';
import "package:email_validator/email_validator.dart";
import 'package:provider/src/provider.dart';
import '../UserManagement.dart';
import 'package:email_login_firebase/route.dart';


class RegisterPage extends StatelessWidget{
  const RegisterPage();
  @override
  Widget build(BuildContext context) {
   final  email=TextEditingController();
   final  password=TextEditingController();
    return Scaffold(appBar: AppBar(title: Text("Register"),),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(30,10,30,10),child:TextFormField( controller: email ,decoration: InputDecoration(hintText: 'mail id',border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),),)),

                  Padding(padding: EdgeInsets.fromLTRB(30,10,30,10),child:TextFormField(obscureText:true,controller: password,decoration: InputDecoration(hintText: 'password',border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),)))),

                  ElevatedButton(onPressed: () async{

                    await context.read<User>().UserRegister(email.text, password.text) ;
                    debugPrint("user registation is done");
                 await  context.read<User>().sendmail();
                    debugPrint("email sent");
                    Navigator.of(context)?.pushNamed(
                        RouteGenerator.validate
                    );
                  }, child: Text("Register"),)


                ])));
  }

}