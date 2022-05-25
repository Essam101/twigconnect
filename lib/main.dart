import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twigconnect/core/theme.dart';
import 'package:twigconnect/utils/colors.dart';
import 'core/featursKeys.dart';
import 'injector.dart' as di;
import 'core/router.dart' as router;
import 'package:firebase_core/firebase_core.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: primaryDark));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twig Connect',
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      onGenerateRoute: router.generateRoute,
      initialRoute: landingViewRoute,
    );
  }
}
