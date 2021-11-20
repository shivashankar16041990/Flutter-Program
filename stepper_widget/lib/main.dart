import 'package:flutter/material.dart';
import 'stepper_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
      BlocProvider<stepper_bloc>(create: (_) => stepper_bloc(), child:
      MaterialApp(home: Scaffold(body: const MyApp()))));
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var steppertype = StepperType.vertical;
          if (constraints.maxWidth > 550) {
            steppertype = StepperType.horizontal;
          }

          return BlocBuilder<stepper_bloc, int>(builder: (context, value) {
            return  Stepper(
              type: steppertype,
              currentStep: value,
              onStepCancel: () {if(value!=0 )
                {
                BlocProvider.of<stepper_bloc>(context).add(decrement());}

              },
              onStepContinue: () {if( value!=2) {
                BlocProvider.of<stepper_bloc>(context).add(increment());
              }
              },
              steps: [
                const Step(title:const  Text("Login"),
                    content:const  Text("Login data"),
                    state: StepState.editing),
                const Step(title: const Text("Personal Info"),
                    content: const Text("Personal Info"),
                    state: StepState.editing),
                const  Step(title: const Text("Qualification Info"),
                    content: const Text("Qualification Info"),
                    state: StepState.editing),


              ],);
          });
        });
  }
  }


