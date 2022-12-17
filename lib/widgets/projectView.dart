import 'package:flutter/material.dart';
import 'package:portfolio/sizes.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:portfolio/widgets/widgets.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({Key? key, required this.image, required this.altText, required this.desc, required this.github, required this.link}) : super(key: key);

  final String image, altText, desc, github, link;

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {


  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      //elevation: 0,

      alignment: Alignment.center,
      child: Container(
        height: screenHeight(context, mulBy: 0.55),
        width: screenWidth(context, mulBy: 0.6),
        decoration: BoxDecoration(
            color: const Color(0xff111111),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white, width: 0.6)),
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 30
        ),
        child: Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.spaceEvenly,
          runAlignment: WrapAlignment.spaceEvenly,
          spacing: 20,
          runSpacing: 40,
          children: [
            Container(
              width: screenWidth(context, mulBy: 0.25),
              height: screenHeight(context, mulBy: 0.4),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white, width: 0.6)),
              child: Imager(
                altText: widget.altText,
                path: widget.image,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white, width: 0.6)),
            ),
          ],
        ),
      ),
    );
  }
}
