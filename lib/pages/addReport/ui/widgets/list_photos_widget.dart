import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:road_reports/widget_general/skeleton_widget.dart';
import 'package:road_reports/pages/addReport/bloc/bloc.dart' as bloc;

class ListPhotosWidget extends StatelessWidget {
  const ListPhotosWidget({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: images.map(
          (e) {
            return Stack(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.file(
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) =>
                            frame == null
                                ? const Skeleton(
                                    height: 100,
                                    width: 100,
                                  )
                                : child,
                    File(
                      e,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: InkWell(
                    onTap: () => context.read<bloc.Bloc>().add(
                          bloc.RemovePhotoEvent(
                            image: e,
                          ),
                        ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}
