import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:localization_flutter/global/global.dart';

class LocaleProvider extends ChangeNotifier {
  FlutterLocalization localization = FlutterLocalization.instance;
  String currentFontFamily = 'Sans';

  LocaleProvider() {
    localization = FlutterLocalization.instance;
    localization.init(
      mapLocales: [
        const MapLocale(
          'en',
          AppLocale.EN,
          countryCode: 'US',
          fontFamily: 'Sans',
        ),
        const MapLocale(
          'hi',
          AppLocale.HI,
          countryCode: 'IN',
          fontFamily: 'Sigma',
        ),
        const MapLocale(
          'es',
          AppLocale.ES,
          countryCode: 'ES',
          fontFamily: 'Monst',
        ),
        const MapLocale('ko', AppLocale.KO, countryCode: 'KO',fontFamily: 'Kalam'),
      ],
      initLanguageCode: 'en',
    );

  }

  void setLocale(Locale newLocale) {
    localization.translate(newLocale.languageCode);
    print(newLocale.languageCode);
    updateFontFamily(newLocale.languageCode);
    notifyListeners();
  }

  String getLanguageCodeFromIndex(int index) {
    List<String> languageCodes = ['en', 'hi', 'es', 'ko'];
    return languageCodes[index];
  }

  void updateFontFamily(String family) {
    switch (family) {
      case 'hi' : currentFontFamily = 'Kalam';
      break;
      case 'es' : currentFontFamily = 'Monst';
      break;
      case 'ko' : currentFontFamily = 'Sigma';
      break;
      default:
        currentFontFamily = 'Sans';
    }
  }
}
