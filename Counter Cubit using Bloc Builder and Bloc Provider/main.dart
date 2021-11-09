import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Bloc Counter",
        home: Scaffold(
          appBar: AppBar(title: Text("Bloc Counter")),
          body: counter_body(),
        ),
      )));
}

class counter_body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(children: <Widget>[
      Expanded(
          child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).Increment();
                //below line also works instead of above line
                //context.read<CounterBloc>().add(Increment());
              },
              child: Text(
                "+",
                textScaleFactor: 4,
              ),
              style: ElevatedButton.styleFrom(fixedSize: const Size(240, 80)))),
      Expanded(child: Center(
          child: BlocBuilder<CounterCubit, int>(builder: (context, count) {
        return Text(
          '$count',
          textScaleFactor: 4,
          style: TextStyle(fontSize: 24.0),
        );
      }))),
      Expanded(
          child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).Decrement();
                //below line also works instead of above line
                // context.read<CounterBloc>().add(Decrement());
              },
              child: Text(
                "-",
                textScaleFactor: 4,
              ),
              style: ElevatedButton.styleFrom(fixedSize: const Size(240, 80))))
    ]));
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void onChange(
      Change<int> change) //overriding function executed when there is a change
  {
    debugPrint("$change");
    super.onChange(change);
  }

  void Increment() => emit(state + 1);

  void Decrement() => emit(state - 1);
}
