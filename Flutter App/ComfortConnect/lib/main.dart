// import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';

import 'screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// _MyHomePageState() {
//   /// Init Alan Button with project key from Alan Studio
//   AlanVoice.addButton(
//       "a0857d0aab49ad43d610608f6aad42102e956eca572e1d8b807a3e2338fdd0dc/stage");

//   /// Handle commands from Alan Studio
//   AlanVoice.onCommand.add((command) {
//     debugPrint("got new command ${command.toString()}");
//   });
// }
