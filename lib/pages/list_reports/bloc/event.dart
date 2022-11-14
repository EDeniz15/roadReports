part of 'bloc.dart';

@immutable
abstract class Event {}

class LoadInitialEvent extends Event {
  LoadInitialEvent();
}

class ReloadListEvent extends Event {}
