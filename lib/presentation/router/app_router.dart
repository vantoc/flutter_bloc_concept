import 'package:flutter/material.dart';
import 'package:flutter_bloc_concept/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concept/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_concept/presentation/screens/third_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/second_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => HomeScreen(
                  title: 'HomeScreen',
                  color: Colors.blueAccent,
                ));
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (_) => SecondScreen(
                  title: 'SecondScreen',
                  color: Colors.redAccent,
                ));
        break;
      case '/third':
        return MaterialPageRoute(
            builder: (_) => ThirdScreen(
                  title: 'ThirdScreen',
                  color: Colors.redAccent,
                ));
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(
                  title: 'HomeScreen',
                  color: Colors.blueAccent,
                ));
    }
  }
}
