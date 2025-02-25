import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:localization_flutter/provider/language_provider.dart';

class VoiceProvider extends ChangeNotifier {
  FlutterTts tts = FlutterTts();
  bool isPlaying = false;
  bool isPaused = false;
  String currentText = "";
  VoiceProvider() {
    tts.setCompletionHandler(() {
      isPlaying = false;
      isPaused = false;
      notifyListeners();
    });
  }
  void speak(String text) async {
    if (isPaused) {
      await tts.speak(currentText);
      print("currentText   $currentText");
    } else {
      currentText = text;
      print(currentText);
      await tts.speak(text);
    }
    isPlaying = true;
    isPaused = false;
    notifyListeners();
  }
  void pause() async {
    await tts.pause();
    isPlaying = false;
    isPaused = true;
    notifyListeners();
  }
  void stop() async {
    await tts.stop();
    isPlaying = false;
    isPaused = false;
    // currentText = "";
    notifyListeners();
  }

}
