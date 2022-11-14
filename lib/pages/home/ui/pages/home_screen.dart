import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:road_reports/pages/addReport/ui/screens/add_report_screen.dart';
import 'package:road_reports/pages/home/ui/widgets/grid_item_widget.dart';
import 'package:road_reports/pages/list_reports/ui/screens/my_reports_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).road_reports,
        ),
        centerTitle: true,
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.extent(
            childAspectRatio: 1.2,
            maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            physics: const NeverScrollableScrollPhysics(),
            children: [
              GridItemWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyReportsScreen(),
                    ),
                  );
                },
                icon: Icons.view_carousel,
                title: AppLocalizations.of(context).seeMyReports,
              ),
              GridItemWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddReporScreen(),
                    ),
                  );
                },
                icon: Icons.add_box,
                title: AppLocalizations.of(context).addReport,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
