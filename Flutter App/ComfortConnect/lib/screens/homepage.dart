import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'mental_health_main_screen.dart';
// import 'src/ui/screen/mental_health_main_screen.dart';


class MentalHealthApp extends StatelessWidget {
  const MentalHealthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return const MaterialApp(
      title: "Mental Health App",
      debugShowCheckedModeBanner: false,
      home: ProviderScope(child: MentalHealthMainScreen()),
    );
  }
}