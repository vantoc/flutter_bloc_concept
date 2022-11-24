import 'package:flutter/material.dart';
import 'package:flutter_bloc_concept/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concept/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_concept/presentation/screens/third_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/second_screen.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CounterCubit(),
                  child: HomeScreen(
                    title: 'HomeScreen',
                    color: Colors.blueAccent,
                  ),
                ));
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CounterCubit(),
                  child: SecondScreen(
                    title: 'SecondScreen',
                    color: Colors.redAccent,
                  ),
                ));
        break;
      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CounterCubit(),
                  child: ThirdScreen(
                    title: 'ThirdScreen',
                    color: Colors.redAccent,
                  ),
                ));
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CounterCubit(),
                  child: HomeScreen(
                    title: 'HomeScreen',
                    color: Colors.blueAccent,
                  ),
                ));
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
