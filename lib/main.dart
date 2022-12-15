import 'dart:ui';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/home.dart';
import 'package:provider/provider.dart';
import 'package:seo/html/seo_controller.dart';
import 'package:seo/html/tree/widget_tree.dart';

import 'components/appBar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ScrollDetail>(
      create: (context) => ScrollDetail(),
    ),
  ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SeoController(
      enabled: true,
      tree: WidgetTree(context: context),
      child: MaterialApp(
        title: 'Chrisbin Sunny | App Developer | Speaker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all<Color>(Color(0x5455889f))
          ),
          fontFamily: "Gilroy"
        ),
        home: const Home(),
      ),
    );
  }
}


