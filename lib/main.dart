import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:localization_flutter/provider/language_provider.dart';
import 'package:localization_flutter/view/screen/home_screen.dart';
import 'package:localization_flutter/view/screen/languageSelect.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterLocalization.instance.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LocaleProvider>(context);
    return MaterialApp(
      supportedLocales: provider.localization.supportedLocales.isNotEmpty
          ? provider.localization.supportedLocales
          : [const Locale('en')],
      localizationsDelegates: provider.localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

