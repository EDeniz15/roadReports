part of 'bloc.dart';

@immutable
abstract class Event {}

class TakePhotoEvent extends Event {}

class SaveReportEvent extends Event {
  final String description;

  SaveReportEvent({required this.description});
}

class RemovePhotoEvent extends Event {
  final String image;

  RemovePhotoEvent({required this.image});
}
