import 'dart:convert';

RoadReport roadReportFromJson(String str) =>
    RoadReport.fromJson(json.decode(str));

String roadReportToJson(RoadReport data) => json.encode(data.toJson());

class RoadReport {
  RoadReport({
    this.report = const [],
  });

  final List<Report> report;

  RoadReport copyWith({
    List<Report>? report,
  }) =>
      RoadReport(
        report: report ?? this.report,
      );

  factory RoadReport.fromJson(Map<String, dynamic> json) => RoadReport(
        report:
            List<Report>.from(json["report"].map((x) => Report.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "report": List<dynamic>.from(report.map((x) => x.toJson())),
      };
}

class Report {
  Report({
    this.description,
    this.image = const [],
  });

  final String? description;
  final List<String> image;

  Report copyWith({
    String? description,
    List<String>? image,
  }) =>
      Report(
        description: description ?? this.description,
        image: image ?? this.image,
      );

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        description: json["description"],
        image: List<String>.from(json["image"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "image": List<dynamic>.from(image.map((x) => x)),
      };
}
