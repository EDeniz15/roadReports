import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShowReportWidget extends StatelessWidget {
  const ShowReportWidget({
    Key? key,
    required this.images,
    required this.description,
  }) : super(key: key);

  final List<String> images;
  final String description;

  @override
  Widget build(BuildContext context) {
    final controller = PageController(viewportFraction: 0.8);
    return SizedBox(
      child: AlertDialog(
        insetPadding: const EdgeInsets.all(10),
        title: Text(
          AppLocalizations.of(context).reportDetail,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            images.isEmpty
                ? SizedBox(
                    child: Icon(
                      Icons.image_not_supported,
                      size: MediaQuery.of(context).size.width / 2,
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          child: PageView.builder(
                            controller: controller,
                            pageSnapping: true,
                            itemCount: images.length,
                            itemBuilder: (context, index) {
                              return Image.file(
                                File(
                                  images[index],
                                ),
                                fit: BoxFit.scaleDown,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
