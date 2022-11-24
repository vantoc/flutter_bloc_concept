import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concept/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concept/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_concept/presentation/screens/third_screen.dart';

import 'presentation/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CounterCubit _counterCubit = CounterCubit();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => BlocProvider.value(
                value: _counterCubit,
                child: HomeScreen(
                  title: 'HomeScreen',
                  color: Colors.blueAccent,
                ),
              ),
          '/second': (context) => BlocProvider.value(
                value: _counterCubit,
                child: SecondScreen(
                  title: 'SecondScreen',
                  color: Colors.redAccent,
                ),
              ),
          '/third': (context) => BlocProvider.value(
                value: _counterCubit,
                child: ThirdScreen(
                  title: 'ThirdScreen',
                  color: Colors.greenAccent,
                ),
              ),
        },
      ),
    );
  }
}
