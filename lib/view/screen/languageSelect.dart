// import 'package:flutter/material.dart';
// import 'package:flutter_localization/flutter_localization.dart';
// import 'package:provider/provider.dart';
// import 'package:localization_flutter/global/global.dart';
// import '../../provider/language_provider.dart';
// import 'home_screen.dart';
//
// class LanguageSelectScreen extends StatefulWidget {
//   const LanguageSelectScreen({super.key});
//
//   @override
//   State<LanguageSelectScreen> createState() => _LanguageSelectScreenState();
// }
//
// class _LanguageSelectScreenState extends State<LanguageSelectScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<LocaleProvider>(context);
//     final localization = provider.localization;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(AppLocale.title.getString(context)),
//         centerTitle: true,
//       ),
//       body: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//         ),
//         itemCount: country.length,
//         itemBuilder: (context, index) {
//           String imagePath = country.keys.elementAt(index);
//           String languageName = country.values.elementAt(index);
//           return GestureDetector(
//             onTap: () {
//               String selectedLanguageCode = provider.getLanguageCodeFromIndex(index);
//               print("--------> ${selectedLanguageCode}");
//               provider.setLocale(Locale(selectedLanguageCode));
//               Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(),));
//             },
//             child: Container(
//               margin: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.2),
//                     blurRadius: 5,
//                     spreadRadius: 2,
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       height: 80,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: AssetImage(imagePath),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Text(
//                     languageName,
//                     style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
