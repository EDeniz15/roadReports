import 'dart:convert';

import 'package:road_reports/pages/addReport/models/report.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();

  factory LocalStorage() {
    return _instance;
  }
  LocalStorage._internal();

  late SharedPreferences _prefs;
  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  RoadReport get roadReport {
    final reports = _prefs.getString('reports');

    if (reports != null) {
      final reportJson = json.decode(reports);
      final report = RoadReport.fromJson(reportJson);
      return report;
    }

    return RoadReport();
  }

  set roadReport(RoadReport reports) {
    final reportJson = json.encode(reports.toJson());
    _prefs.setString('reports', reportJson);
  }
}
