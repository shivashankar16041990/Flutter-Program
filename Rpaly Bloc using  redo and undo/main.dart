import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:replay_bloc/replay_bloc.dart';

void main() {
  runApp(BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
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
    return Center(child:Column(children: <Widget>[Center(

        child: Row(children: <Widget>[
      Expanded(
          child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(Increment());
                //below line also works instead of above line
                //context.read<CounterBloc>().add(Increment());
              },
              child: Text(
                "+",
                textScaleFactor: 4,
              ),
              style: ElevatedButton.styleFrom(fixedSize: const Size(240, 80)))),
      Expanded(child: Center(
          child: BlocBuilder<CounterBloc, int>(builder: (context, count) {
        return Text(
          '$count',
          textScaleFactor: 4,
          style: TextStyle(fontSize: 24.0),
        );
      }))),
      Expanded(
          child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(Decrement());
                //below line also works instead of above line
                // context.read<CounterBloc>().add(Decrement());
              },
              child: Text(
                "-",
                textScaleFactor: 4,
              ),
    style: ElevatedButton.styleFrom(fixedSize: const Size(240, 80))))
    ]))

    ,Center(child:Row(
    children: <Widget>[
    Expanded(
    child: ElevatedButton(
    onPressed: () {
    BlocProvider.of<CounterBloc>(context).undo();
    //below line also works instead of above line
    // context.read<CounterBloc>().add(Decrement());
    },
    child: Text(
    "undo",
    textScaleFactor: 4,
    ),
    style: ElevatedButton.styleFrom(fixedSize: const Size(240, 80)))),

      Expanded(
          child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).redo();
                //below line also works instead of above line
                // context.read<CounterBloc>().add(Decrement());
              },
              child: Text(
                "redo",
                textScaleFactor: 4,
              ),
              style: ElevatedButton.styleFrom(fixedSize: const Size(240, 80))))





    ]))


    ]));
  }
}

class CounterEvent extends ReplayEvent {}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}

class CounterBloc extends ReplayBloc<CounterEvent, int> {
  void onChange(Change<int> change) //overriding function executed when there is a change
  {
    debugPrint("$change");
    super.onChange(change);
  }

  CounterBloc() : super(0) {
    on<Increment>((event, emit) => emit(state + 1));
    on<Decrement>((event, emit) => emit(state - 1));
  }



}
