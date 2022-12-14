

import 'package:flutter/material.dart';
import 'package:portfolio/sizes.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //TODO
        SizedBox(
          width: screenWidth(context),
          height: screenHeight(context),
          child: Text(
            "Flutter Dart Firebase Supabase Google Cloud Maps GoLang",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 80,
              color: Colors.white
            ),
          ),
        ),
        Container(
      width: screenWidth(context, mulBy: 0.5),
      height: screenHeight(context),
      constraints: const BoxConstraints(
          minWidth: 500
      ),
      color: Colors.red.withOpacity(0),
    )

      ],
    );
  }
}
