import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart' as bloc;
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import 'package:road_reports/config/preferences.dart';
import 'package:road_reports/pages/addReport/models/report.dart';

part 'event.dart';
part 'state.dart';

class Bloc extends bloc.Bloc<Event, State> {
  Bloc() : super(initialState) {
    on<TakePhotoEvent>(_takePhotoEvent);
    on<SaveReportEvent>(_saveReportEvent);
    on<RemovePhotoEvent>(_removePhotoEvent);
  }
  static State get initialState => const InitialState(
        Model(),
      );

  void _takePhotoEvent(TakePhotoEvent event, Emitter<State> emit) async {
    emit(
      TakingPhotoState(
        state.model,
      ),
    );
    try {
      final photo = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      List<String> myPhotos = [
        photo!.path,
        ...List.from(
          state.model.images,
        ),
      ];
      emit(
        PhotoTakeState(
          state.model.copyWith(
            images: myPhotos,
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

  void _saveReportEvent(SaveReportEvent event, Emitter<State> emit) {
    emit(
      SavingReportState(state.model),
    );
    try {
      final localStorage = LocalStorage();
      List<Report> myReports = [
        Report(
          description: event.description,
          image: state.model.images,
        ),
        ...List.from(localStorage.roadReport.report)
      ];

      localStorage.roadReport = RoadReport(
        report: myReports,
      );
      emit(
        ReportSavedState(state.model),
      );
    } catch (e) {
      emit(
        FailuredState(
          state.model,
        ),
      );
    }
  }

  void _removePhotoEvent(RemovePhotoEvent event, Emitter<State> emit) {
    try {
      state.model.images.removeWhere(
        (element) => element == event.image,
      );
      emit(
        PhotoRemovedState(
          state.model,
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
