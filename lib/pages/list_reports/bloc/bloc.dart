import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart' as bloc;
import 'package:equatable/equatable.dart';

import 'package:road_reports/config/preferences.dart';
import 'package:road_reports/pages/addReport/models/report.dart';

part 'event.dart';
part 'state.dart';

class Bloc extends bloc.Bloc<Event, State> {
  Bloc() : super(initialState) {
    on<LoadInitialEvent>(_loadInitialEvent);
  }
  static State get initialState => const InitialState(
        Model(),
      );

  void _loadInitialEvent(LoadInitialEvent event, Emitter<State> emit) {
    emit(
      LoadState(
        state.model,
      ),
    );

    try {
      final myReports = LocalStorage().roadReport.report;
      emit(
        InitialState(
          state.model.copyWith(
            myReports: myReports,
          ),
        ),
      );
    } catch (e) {
      emit(
        FailuredState(
          state.model,
        ),
      );
    }
  }
}
