import 'package:flutter/material.dart';
import 'package:portfolio/components/navPill.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/constants/variables.dart';
import 'package:portfolio/screens/about.dart';
import 'package:portfolio/screens/latest.dart';
import 'package:portfolio/screens/projects.dart';
import 'package:portfolio/screens/social.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'screens/home.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 720;
    return Scaffold(
      body: Stack(
        children: [
          Scrollbar(
            controller: Variables.scrollController,
            child: SingleChildScrollView(
              controller: Variables.scrollController,
              child: Column(
                children: [
                  Home(key: Variables.keys[0]),
                  About(key: Variables.keys[1]),
                  Latest(key: Variables.keys[2]),
                  Projects(key: Variables.keys[3]),
                  Social(key: Variables.keys[4]),
                  Padding(
                    // room for the bottom tab bar on phones
                    padding: EdgeInsets.fromLTRB(24, 24, 24, compact ? 110 : 40),
                    child: Texter("Built with Flutter by Chrisbin Sunny", style: mono(context)),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: compact ? null : 20,
            bottom: compact ? 16 : null,
            child: SafeArea(child: Center(child: NavPill(compact: compact))),
          ),
        ],
      ),
    );
  }
}
