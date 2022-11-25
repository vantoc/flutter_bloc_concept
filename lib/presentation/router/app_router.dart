import 'package:flutter/material.dart';
import 'package:flutter_bloc_concept/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concept/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_concept/presentation/screens/third_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concept/presentation/screens/timeduration_screen.dart';
import '../screens/second_screen.dart';
import '../screens/settings_screen.dart';

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
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => SettingsScreen(),
        );
      case '/timeduration':
        return MaterialPageRoute(
          builder: (_) => TimeDurationScreen(),
        );
      default:
        return MaterialPageRoute(builder: (_) => TimeDurationScreen());
    }
  }
}
