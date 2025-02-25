import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  final Function setLocale;

  const HomeScreen({super.key, required this.setLocale});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    List<String> verses = [
      localizations.verse1,
      localizations.verse2,
      localizations.verse3,
      localizations.verse4,
      localizations.verse5,
      localizations.verse6,
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff401A03),
        title: SizedBox(
          child: Text(
            localizations.gitaName,
            style: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            color: Color(0xff401A03),
            onSelected: (String languageCode) {
              widget.setLocale(Locale(languageCode));
              print(languageCode);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'en',
                  child: Text(
                    "English",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const PopupMenuItem(
                  value: 'hi',
                  child: Text(
                    "Hindi",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const PopupMenuItem(
                  value: 'gu',
                  child: Text(
                    "Gujarati",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const PopupMenuItem(
                  value: 'es',
                  child: Text(
                    "Spanish",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ];
            },
            icon: Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset('assets/images/gita-101.jpg', fit: BoxFit.cover),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.4),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
            child: ListView.builder(
              itemCount: verses.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  color: Colors.black38,
                  margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      verses[index],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
