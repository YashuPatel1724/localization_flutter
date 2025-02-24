import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:localization_flutter/global/global.dart';

import '../../provider/language_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LocaleProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocale.title.getString(context),),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (String languageCode) {
              provider.setLocale(Locale(languageCode));
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(value: 'en', child: Text("English")),
                const PopupMenuItem(value: 'hi', child: Text("Hindi")),
                const PopupMenuItem(value: 'es', child: Text("Spanish")),
                const PopupMenuItem(value: 'ko', child: Text("Korean")),
              ];
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              AppLocale.paragraph.getString(context),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,fontFamily: provider.currentFontFamily),
            ),

          ],
        ),
      ),
    );
  }
}
