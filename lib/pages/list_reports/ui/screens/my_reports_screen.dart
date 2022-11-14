import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:road_reports/pages/list_reports/ui/widgets/list_report_widget.dart';
import 'package:road_reports/pages/addReport/ui/screens/add_report_screen.dart';
import 'package:road_reports/pages/list_reports/bloc/bloc.dart' as bloc;

class MyReportsScreen extends StatelessWidget {
  const MyReportsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).myReports),
        centerTitle: true,
      ),
      body: BlocBuilder<bloc.Bloc, bloc.State>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                state.model.myReports.isEmpty
                    ? Text(
                        AppLocalizations.of(context).youDontHaveReport,
                      )
                    : ListReportsWidget(
                        myReports: state.model.myReports,
                      )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddReporScreen(),
            ),
          );
        },
        tooltip: AppLocalizations.of(context).addReport,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
