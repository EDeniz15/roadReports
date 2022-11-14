import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:road_reports/pages/addReport/bloc/bloc.dart' as bloc;
import 'package:road_reports/pages/addReport/ui/widgets/list_photos_widget.dart';
import 'package:road_reports/widget_general/skeleton_widget.dart';

class TakePhotoWidget extends StatelessWidget {
  const TakePhotoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<bloc.Bloc, bloc.State>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: InkWell(
            onTap: () => context.read<bloc.Bloc>().add(
                  bloc.TakePhotoEvent(),
                ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DottedBorder(
                    color: Colors.deepOrange,
                    strokeWidth: 1,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 5.0,
                          left: 10.0,
                          child: Icon(
                            Icons.post_add,
                            size: 25.0,
                            color: Colors.deepOrange.withOpacity(0.8),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 12.0,
                              right: 12.0,
                              bottom: 12.0,
                              top: 30.0,
                            ),
                            child: state.model.images.isEmpty
                                ? BlocBuilder<bloc.Bloc, bloc.State>(
                                    builder: (context, state) {
                                      if (state is bloc.TakingPhotoState) {
                                        return const Skeleton(
                                          width: 100,
                                          height: 100,
                                        );
                                      }
                                      return Column(
                                        children: [
                                          Icon(
                                            Icons.add_a_photo,
                                            size: 70.0,
                                            color: Colors.deepOrange
                                                .withOpacity(0.8),
                                          ),
                                          Text(
                                            AppLocalizations.of(context)
                                                .addImage,
                                          )
                                        ],
                                      );
                                    },
                                  )
                                : ListPhotosWidget(images: state.model.images),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
