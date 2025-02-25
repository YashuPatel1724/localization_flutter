import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:localization_flutter/provider/language_provider.dart';
import 'package:localization_flutter/provider/voice_provider.dart';
import 'package:localization_flutter/view/screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterLocalization.instance.ensureInitialized();
  runApp(
    MultiProvider(
     providers: [
       ChangeNotifierProvider(create: (context) => LocaleProvider(),),
       ChangeNotifierProvider(create: (context) => VoiceProvider(),),
     ],
      child: MyApp(),
    ),

  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LocaleProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: provider.locale,
      supportedLocales: [
        Locale('en'),
        Locale('hi'),
        Locale('gu'),
        Locale('es'),
      ],
      debugShowCheckedModeBanner: false,
      home:  HomeScreen(setLocale: provider.setLocale)
    );
  }

}

