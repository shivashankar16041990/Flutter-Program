import 'package:flutter/material.dart';
import 'package:hive_username_password/route/route.dart';
import 'package:hive_username_password/pages/pages.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  final email = TextEditingController();
  final password = TextEditingController();

  var checked = false;

  @override
  Widget build(BuildContext context) {
    if (context.read<CheckBoxWidgetwithHiveBox>().issettingset()) {
      final setting = context.read<CheckBoxWidgetwithHiveBox>().getsetting();
      email.text = setting[0];
      password.text = setting[1];
      context.read<CheckBoxWidgetwithHiveBox>().setCheck(true);
    }

    return Scaffold(
        appBar: AppBar(title: Text("Hive")),
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: 'mail id',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextFormField(
                      obscureText: true,
                      controller: password,
                      decoration: InputDecoration(
                          hintText: 'password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )))),
              Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Consumer<CheckBoxWidgetwithHiveBox>(
                            builder: (context, state, _) {
                          if (state.check) {
                            return Checkbox(
                              value: true,
                              onChanged: (check) {
                                state.setCheck(false);
                                debugPrint("check set to ${state.check}");
                              },
                            );
                          } else {
                            return Checkbox(
                              value: false,
                              onChanged: (check) {
                                state.setCheck(true);
                                debugPrint("check set to ${state.check}");
                              },
                            );
                          }
                        }),
                        Text("Remember user name and password")
                      ]))),
              ElevatedButton(
                onPressed: () async {
                  if (context.read<CheckBoxWidgetwithHiveBox>().check == true) {
                    context
                        .read<CheckBoxWidgetwithHiveBox>()
                        .setsetting(email.text, password.text);
                  } else {
                    context.read<CheckBoxWidgetwithHiveBox>().clear();
                  }

                  Navigator.of(context)?.pushNamed(RouteGenerator.welcome_user,
                      arguments:
                          User(name: email.text, password: password.text));
                },
                child: Text("Register"),
              ),
            ],
          ),
        )));
  }
}
