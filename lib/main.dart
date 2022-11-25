import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concept/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concept/cubit/internet_cubit.dart';
import 'package:flutter_bloc_concept/cubit/settings_cubit.dart';
import 'package:flutter_bloc_concept/presentation/router/app_router.dart';
import 'package:flutter_bloc_concept/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_concept/presentation/screens/third_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'logic/bloc/time_bloc.dart';
import 'logic/utility/app_bloc_observer.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  Bloc.observer = AppBlocObserver();

  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  const MyApp({super.key, required this.appRouter, required this.connectivity});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider<SettingsCubit>(
          create: (context) => SettingsCubit(),
        ),
        BlocProvider<TimeBloc>(
          create: (context) => TimeBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
