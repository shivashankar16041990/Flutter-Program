import 'package:flutter/material.dart';
import "package:email_validator/email_validator.dart";
import 'package:provider/src/provider.dart';
import '../UserManagement.dart';
import 'package:email_login_firebase/route.dart';

class ValidationPage extends StatelessWidget{
  const ValidationPage();
  @override
  Widget build(BuildContext context) {

    final  validate=TextEditingController();
    return Scaffold(appBar: AppBar(title: Text("Register: validate code"),),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
            Padding(padding: EdgeInsets.fromLTRB(30,10,30,10),child:Text("please see your mail,after clicking on link click on below button")),



                  ElevatedButton(onPressed: () async{

                    if(context.read<User>().vadidateCode()==true)
                    Navigator.of(context)?.pushNamed(
                        RouteGenerator.welcomeUser
                    );
                  }, child: Text("signin"),)


                ])));
  }

}