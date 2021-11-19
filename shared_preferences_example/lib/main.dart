import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(MaterialApp(home:Scaffold(appBar:AppBar(title: Text("sharedPreferences"),),body: MyApp())));
}

class MyApp extends StatelessWidget {
      final usernamecontroller=TextEditingController();
      final passwordcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
        Column (mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
          TextFormField(controller: usernamecontroller,decoration: InputDecoration(hintText: "Username"),),
          TextFormField(controller: passwordcontroller,decoration: InputDecoration(hintText: "password"),),
          IconButton(onPressed: savepref, icon: Icon(Icons.save)),
          FutureBuilder<String>(future:showpref() ,builder: (context,snapshot){
            if(snapshot.hasData){
              if(snapshot.data!=null) {
              return Text(snapshot.data.toString());
              }
            }
            return Text("set username and password");
          })


        ],);




  }
  void savepref() async{
     final sharedpref= await SharedPreferences.getInstance();
     await sharedpref.setString('username', usernamecontroller.text);
     await sharedpref.setString('password', passwordcontroller.text);

  }
 Future< String> showpref(
      )async{
    final sharedpref= await SharedPreferences.getInstance();
   final username= await sharedpref.getString("username");
    final password= await sharedpref.getString("password");
   return "Username $username \n password $password";



}




}