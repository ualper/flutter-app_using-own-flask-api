import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'R&M API TEST',
      home: HomePage(),
    );
  }
}
