import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concept/logic/bloc/time_bloc.dart';

class TimeDurationScreen extends StatefulWidget {
  const TimeDurationScreen({super.key});

  @override
  State<TimeDurationScreen> createState() => _TimeDurationScreenState();
}

class _TimeDurationScreenState extends State<TimeDurationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<TimeBloc, TimeState>(
        builder: (context, state) {
          final String minuteStr =
              ((state.timeDuration / 60) % 60).floor().toString().padLeft(2);
          final String secconadsStr =
              (state.timeDuration % 60).floor().toString().padLeft(2, '0');
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '$minuteStr:$secconadsStr',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buttons(context, state),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  buttons(context, state) {
    final TimeBloc timeBloc = BlocProvider.of<TimeBloc>(context);
    if (state is InitialState) {
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () => timeBloc.add(StartEvent(state.timeDuration)),
        ),
      ];
    }
    if (state is RunningState) {
      return [
        FloatingActionButton(
          child: Icon(Icons.pause),
          onPressed: () {
            timeBloc.add(PauseEvent());
          },
        ),
        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () {
            timeBloc.add(ResetEvent());
          },
        ),
      ];
    } else if (state is PauseState) {
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            timeBloc.add(ResumeEvent());
          },
        ),
        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () {
            timeBloc.add(ResetEvent());
          },
        ),
      ];
    } else if (state is CompletedState) {
      return [
        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () {
            timeBloc.add(ResetEvent());
          },
        ),
      ];
    }
  }
}
