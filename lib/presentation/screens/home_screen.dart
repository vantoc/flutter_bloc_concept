import 'package:flutter/material.dart';
import 'package:flutter_bloc_concept/constants/enums.dart';
import 'package:flutter_bloc_concept/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concept/cubit/internet_cubit.dart';
import 'package:flutter_bloc_concept/presentation/screens/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.Wifi) {
          BlocProvider.of<CounterCubit>(context).increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.Mobile) {
          BlocProvider.of<CounterCubit>(context).decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () => Navigator.pushNamed(context, '/settings')),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state is InternetConnected &&
                      state.connectionType == ConnectionType.Wifi) {
                    return Text("Wifi");
                  } else if (state is InternetConnected &&
                      state.connectionType == ConnectionType.Mobile) {
                    return Text('Mobile');
                  } else if (state is InternetDisconnected) {
                    return Text('Disconnected');
                  }
                  return CircularProgressIndicator();
                },
              ),
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.wasIncremented == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Incremented'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  } else if (state.wasIncremented == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Decremented'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Text(
                    '${state.counterValue}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                      // context.bloc<CounterCubit>().decrement();
                    },
                    tooltip: 'Decrement',
                    child: Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    heroTag: "btn1d",
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              MaterialButton(
                child: Text(
                  'Go to second screen',
                  style: TextStyle(color: Colors.white),
                ),
                color: widget.color,
                onPressed: () {
                  Navigator.of(context).pushNamed("/second");
                },
              ),
              SizedBox(
                height: 24,
              ),
              MaterialButton(
                child: Text(
                  'Go to second screen',
                  style: TextStyle(color: Colors.white),
                ),
                color: widget.color,
                onPressed: () {
                  Navigator.of(context).pushNamed("/third");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
