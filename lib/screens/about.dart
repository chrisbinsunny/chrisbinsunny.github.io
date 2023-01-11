

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:portfolio/components/contactCard.dart';
import 'package:portfolio/sizes.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:provider/provider.dart';

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
      //color: const Color(0xff0c0c0c),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff0c0c0c),
            Color(0xff0f1617),
            Color(0xff0c0c0c)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
      constraints: BoxConstraints(
        minWidth: 500,
        minHeight: screenHeight(context),
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
            ],
          ),
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

        ],
      ),
    );
  }
}
