import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:road_reports/pages/addReport/models/report.dart';
import 'package:road_reports/pages/list_reports/ui/widgets/detail_report_widget.dart';
import 'package:road_reports/widget_general/skeleton_widget.dart';

class ListReportsWidget extends StatelessWidget {
  const ListReportsWidget({
    Key? key,
    required this.myReports,
  }) : super(key: key);

  final List<Report> myReports;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: myReports.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => showDialog(
              context: context,
              builder: (context) => ShowReportWidget(
                images: myReports[index].image,
                description: myReports[index].description ?? '',
              ),
            ),
            child: SizedBox(
              width: 100,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 20.0,
                            ),
                            child: Icon(
                              Icons.remove_red_eye_outlined,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context).description,
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(
                                        0.5,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    myReports[index].description ?? '',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: myReports[index].image.isEmpty
                              ? const SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Icon(
                                    Icons.image_not_supported,
                                  ),
                                )
                              : Image.file(
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.scaleDown,
                                  frameBuilder: (context, child, frame,
                                          wasSynchronouslyLoaded) =>
                                      frame == null
                                          ? const Skeleton(
                                              height: 50,
                                              width: 50,
                                            )
                                          : child,
                                  File(
                                    myReports[index].image.first,
                                  ),
                                  errorBuilder: (_, __, ___) => const Icon(
                                    Icons.image_not_supported,
                                  ),
                                ),
                        ),
                        myReports[index].image.length > 1
                            ? Positioned(
                                right: 0,
                                bottom: 0,
                                child: Card(
                                  color: Colors.black,
                                  shadowColor: Colors.red,
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      '+${myReports[index].image.length}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink()
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
