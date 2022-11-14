import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:road_reports/pages/addReport/bloc/bloc.dart' as bloc;
import 'package:road_reports/pages/addReport/ui/widgets/take_photo_widget.dart';
import 'package:road_reports/pages/list_reports/bloc/bloc.dart' as bloc_report;

class AddReporScreen extends StatelessWidget {
  const AddReporScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).addReport,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => bloc.Bloc(),
          child: BlocListener<bloc.Bloc, bloc.State>(
            listener: (context, state) {
              if (state is bloc.ReportSavedState) {
                context.read<bloc_report.Bloc>().add(
                      bloc_report.LoadInitialEvent(),
                    );
                Navigator.pop(context);
              }
            },
            child: Center(
              child: Column(
                children: [
                  const TakePhotoWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Form(
                      key: formKey,
                      child: TextFormField(
                        controller: controller,
                        minLines: 1,
                        maxLines: 4,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return AppLocalizations.of(context)
                                .descriptionNotEntered;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText:
                              AppLocalizations.of(context).enterTheDescription,
                        ),
                      ),
                    ),
                  ),
                  BlocBuilder<bloc.Bloc, bloc.State>(
                    builder: (context, state) {
                      return OutlinedButton.icon(
                        onPressed: () => formKey.currentState!.validate()
                            ? context.read<bloc.Bloc>().add(
                                  bloc.SaveReportEvent(
                                    description: controller.text,
                                  ),
                                )
                            : {},
                        icon: const Icon(
                          Icons.save,
                        ),
                        label: Text(
                          AppLocalizations.of(context).save,
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
