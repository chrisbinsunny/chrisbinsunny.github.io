


import 'package:flutter/material.dart';
import 'package:portfolio/screens/mainView.dart';
import 'package:portfolio/sizes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff0c0c0c),
        width: screenWidth(context),
        child: Wrap(
          children: [
            MainView()
          ],
        ),
      ),
    );
  }
}
