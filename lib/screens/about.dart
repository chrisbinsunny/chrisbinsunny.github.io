

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
          SizedBox(
            width: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Texter(
                  "About Me",
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
                  "Ever since I was a teenager, programming has been a passion of mine. "
                      "My goal is to make technology accessible to everyone, which is why I frequently give tech talks and workshops at schools and colleges. "
                      "Currently, I am focused on creating clean and user-friendly UI/UX using the Flutter Web framework.\n\n"
                      "Over the past few years, I have had the opportunity to work on a wide range of Flutter mobile and web projects, gaining a wealth of experience in the process. "
                      "By working for both companies and individuals across the globe and attending meetups, I have had the opportunity to learn from and collaborate with some truly exceptional and motivated individuals.\n\n"
                      "I am currently working remotely with a select group of freelance clients, while also open to new opportunities.",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 19,
                  ),
                  textAlign: TextAlign.start,
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
                    vertical: 10
                ),
                constraints: const BoxConstraints(
                  minHeight: 480,
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
