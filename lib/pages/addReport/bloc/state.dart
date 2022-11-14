part of 'bloc.dart';

abstract class State extends Equatable {
  final Model model;
  const State(this.model);
  @override
  List<Object> get props => [model];
}

class InitialState extends State {
  const InitialState(Model model) : super(model);
}

class TakingPhotoState extends State {
  const TakingPhotoState(super.model);
}

class PhotoTakeState extends State {
  const PhotoTakeState(super.model);
}

class SavingReportState extends State {
  const SavingReportState(super.model);
}

class ReportSavedState extends State {
  const ReportSavedState(super.model);
}

class PhotoRemovedState extends State {
  const PhotoRemovedState(super.model);
}

class FailuredState extends State {
  const FailuredState(super.model);
}

class Model extends Equatable {
  final List<String> images;

  const Model({
    this.images = const [],
  });

  Model copyWith({
    List<String>? images,
  }) =>
      Model(
        images: images ?? this.images,
      );

  @override
  List<Object?> get props => [
        images,
      ];
}
