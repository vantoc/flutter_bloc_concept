part of 'time_bloc.dart';

@immutable
abstract class TimeEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class StartEvent extends TimeEvent {
  final int timeDuration;

  StartEvent(this.timeDuration);
}

class RunEvent extends TimeEvent {
  final int timeDuration;
  RunEvent(this.timeDuration);
}

class PauseEvent extends TimeEvent {}

class ResumeEvent extends TimeEvent {}

class ResetEvent extends TimeEvent {}
