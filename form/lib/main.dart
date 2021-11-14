import 'dart:collection';
import "package:provider/provider.dart";

import 'package:flutter/material.dart';

void main() {
  runApp(ChangeNotifierProvider<DropDown>(lazy:true,create:(_)=>DropDown(),child:MaterialApp(
    home: Scaffold(appBar: AppBar(title: const Text("Form")), body: MyLoginForm()),
  )));
}

class MyLoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyLoginFormState();
  }
}

class MyLoginFormState extends State<MyLoginForm> {
  final _key = GlobalKey<FormState>();
  var emailcontroller =TextEditingController();
  var passwordcontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {




    return SingleChildScrollView(child:Form(
      key: _key,
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextFormField(controller: emailcontroller,
                validator: _emailvalidator,
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  hintText: "e mail",
                ),),


              TextFormField(controller: passwordcontroller,
                validator: _passwordvalidator,
                obscureText: true,

                decoration: const InputDecoration(
                  icon: Icon(Icons.vpn_key_outlined),
                  hintText: "password",

                ),
              ),

              ElevatedButton (child: const Text("Login"),onPressed: _login,),
              Consumer<DropDown>(builder:(context,dropdown,_){
                debugPrint("list length ${dropdown.listlength}");

                return DropdownButtonFormField(items:dropdown._menuitems, value: dropdown.text,
                    onChanged:(value)=>dropdown.setText(value.toString()) );
              })

            ]),
      ),
    ));
  }

  String? _emailvalidator(String? value){
    debugPrint("${value?.length??100}");
    if (value==null){

      return 'Put your mail id';

    }

    if (0==value?.length){

      return 'Put your mail id';

    }
    else
        {
          return null;
        }}

    String? _passwordvalidator(String? value){
      if (value!=null){
        if(value.length<8){
          return 'password must be greater than 8 char';
                 }



      }
      if (value==null){
        return "put the password";
      }
      else
      {
        return null;
      }

  }

  void _login()
  {
    if(_key.currentState?.validate()??false)
      {
        debugPrint("form is submitted");
      }
    debugPrint(passwordcontroller.text);
    debugPrint(emailcontroller.text);
    var start =emailcontroller.selection.start;
    var end=emailcontroller.selection.end;
    debugPrint(emailcontroller.text.substring(start,end));
  }



}

class DropDown with ChangeNotifier{

int get listlength=>_list.length;




  static final  _list=["pasta","pizza","shira"].map<DropdownMenuItem<String>>((item) => DropdownMenuItem<String>(
    value: item,
    child: Text(item),
  )



  ).toList();
 late final _menuitems=UnmodifiableListView( _list);
  var _text="pasta";
  String get text =>_text;
  void setText(String value){
    _text=value;
    notifyListeners();

  }





}