import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:road_reports/config/preferences.dart';
import 'package:road_reports/pages/home/ui/pages/home_screen.dart';
import 'package:road_reports/pages/list_reports/bloc/bloc.dart' as bloc;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = LocalStorage();
  await prefs.initPrefs();
  runApp(
    BlocProvider(
      create: (context) => bloc.Bloc()
        ..add(
          bloc.LoadInitialEvent(),
        ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PT Nativapps',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
