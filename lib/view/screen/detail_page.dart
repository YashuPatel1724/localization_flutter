
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization_flutter/provider/voice_provider.dart';
import 'package:provider/provider.dart';

import '../../provider/language_provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LocaleProvider>(context);
    var ttsProvider = Provider.of<VoiceProvider>(context);
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
        title: Text('Detail Page',style: TextStyle(color: Colors.white),),
        leading: GestureDetector(
          onTap: () {
            ttsProvider.stop();
            Navigator.pop(context);
          },
          child: Icon(CupertinoIcons.arrow_left,color: Colors.white,),
        ),
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 150.0),
                  child: Card(
                    elevation: 4,
                    color: Colors.black38,
                    margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        verses[provider.selectedIndex],
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(bottom: 100),
                  height: 60,
                  width :  60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff401A03)
                  ),
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      if (ttsProvider.isPlaying) {
                        ttsProvider.pause();
                      } else {
                        ttsProvider.speak(verses[provider.selectedIndex]);
                      }
                    },
                    child: Icon(
                      ttsProvider.isPlaying
                          ? CupertinoIcons.pause
                          : CupertinoIcons.play,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
