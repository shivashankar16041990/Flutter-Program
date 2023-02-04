import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper_widget/bloc/event.dart';

import 'bloc/bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (_) => StepIndexBloc(0),
    child: MaterialApp(
      home: Scaffold(
        body: MyApp(),
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stepper(
        steps: [
          Step(
              title: Text("Personal Dat a"),
              content: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: "name"),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "mail"),
                  )
                ],
              )),
          Step(
              title: Text("Address"),
              content: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: "address"),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "pin"),
                  )
                ],
              )),
          Step(
              title: Text("Payment"),
              content: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: "Upi id"),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "amount"),
                  )
                ],
              )),
        ],
        onStepCancel: () {
          BlocProvider.of<StepIndexBloc>(context).add(decreament());
        },
        currentStep: context.watch<StepIndexBloc>().state,
        onStepContinue: () {
          BlocProvider.of<StepIndexBloc>(context).add(increament());
        },
      ),
    );
  }
}
