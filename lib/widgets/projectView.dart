

import 'package:flutter/material.dart';
import 'package:portfolio/sizes.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({Key? key}) : super(key: key);

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      alignment: Alignment.center,
      child: Container(
        height: screenHeight(context,mulBy: 0.5),
        width: screenWidth(context, mulBy: 0.5),
        color: Colors.red
      ),
    );
  }
}
