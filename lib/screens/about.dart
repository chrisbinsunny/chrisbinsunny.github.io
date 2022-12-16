

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/sizes.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:seo/html/seo_widget.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, mulBy: 1),
      //height: screenHeight(context)-70,  ///Reducing 70 for appbar
      color: const Color(0xff0c0c0c),
      //color: Colors.green,
      constraints: BoxConstraints(
      minWidth: 500,
        minHeight: screenHeight(context)-70,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(context, mulBy: 0.05),
        vertical: screenHeight(context, mulBy: 0.07)
      ),
      child: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.spaceEvenly,
        runAlignment: WrapAlignment.spaceEvenly,
        spacing: 20,
        runSpacing: 40,
        children: [
          SizedBox(
            width: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Texter(
                  "About Chrisbin",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 34,
                    color: Theme.of(context).secondaryHeaderColor
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Texter(
                  "Programming was always my area of interest since teenage. My main objective is to make technology reach everyone, so "
                    "I conduct tech talks at schools and colleges. Currently on a mission to make clean UI/UX using Flutter Web.",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Texter(
                "Skill Stack",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 34,
                    color: Theme.of(context).secondaryHeaderColor
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 480,
                width: 400,
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xff0c0c0c),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white,
                    width: 0.7
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x2dffffff),
                      spreadRadius: 4,
                      blurRadius: 15
                    )
                  ]
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: const Texter(
                  "Flutter, Dart, Firebase, Supabase, Google Cloud Maps, GoLang",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 52,
                      color: Color(0x6b3093c0)
                  ),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
