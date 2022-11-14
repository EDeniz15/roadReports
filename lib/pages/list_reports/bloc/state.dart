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

class LoadState extends State {
  const LoadState(Model model) : super(model);
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

class FailuredState extends State {
  const FailuredState(super.model);
}

class Model extends Equatable {
  final List<Report> myReports;

  const Model({
    this.myReports = const [],
  });

  Model copyWith({
    List<Report>? myReports,
  }) =>
      Model(
        myReports: myReports ?? this.myReports,
      );

  @override
  List<Object?> get props => [myReports];
}
