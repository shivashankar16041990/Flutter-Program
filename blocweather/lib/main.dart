import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/weather_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => WeatherBloc(),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlocBuilder<WeatherBloc, WeatherState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return Text(state.info);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<WeatherBloc>(context).add(Cold());
                  },
                  child: const Text("cold")),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<WeatherBloc>(context).add(Hot());
                  },
                  child: const Text("hot")),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<WeatherBloc>(context).add(Freezing());
                  },
                  child: const Text("Freezing"))
            ],
          )
        ],
      ),
    );
  }
}
