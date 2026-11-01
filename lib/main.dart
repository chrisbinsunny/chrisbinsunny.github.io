
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/firebase/analytics.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/index.dart';
import 'package:seo/html/seo_controller.dart';
import 'package:seo/html/tree/widget_tree.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  runApp(
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SeoController(
      enabled: true,
      tree: WidgetTree(context: context),
      child: MaterialApp(
        title: 'Chrisbin Sunny - Mobile Developer | Speaker',
        debugShowCheckedModeBanner: false,
        navigatorObservers: [
          AnalyticsService.getAnalyticsObserver()
        ],
        theme: buildTheme(Brightness.light),
        darkTheme: buildTheme(Brightness.dark),
        home: const Index(),
      ),
    );
  }
}


