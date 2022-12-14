


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
        color: Colors.green.withOpacity(0.96),
        child: Wrap(
          children: [
            MainView()
          ],
        ),
      ),
    );
  }
}
