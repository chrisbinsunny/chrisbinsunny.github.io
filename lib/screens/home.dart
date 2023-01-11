

import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/contactCard.dart';
import 'package:portfolio/sizes.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:seo/html/seo_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {



    return Container(
      width: screenWidth(context, mulBy: 1),
     // height: screenHeight(context),  ///Reducing 70 for appbar
      padding: EdgeInsets.symmetric(
          horizontal: 30,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff0c0c0c),

        gradient: LinearGradient(
            colors: [
              Color(0xff0c0c0c),
              Color(0xff04324f),
              Color(0xff0c0c0c),
            ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      constraints: BoxConstraints(
      minWidth: 500,
        minHeight:  screenHeight(context),  ///Reducing 70 for appbar
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 20,
        spacing: 20,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(screenWidth(context)<720)
              SizedBox(
                height: screenHeight(context, mulBy: 0.18),
              ),
              const Texter(
                " Hey, I am",
                style: TextStyle(
                    fontSize: 34
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,

                child: RichTexter(
                  text: "Chrisbin Sunny",
                  child: RichText(
                    text: const TextSpan(
                        text: "Chrisbin\n",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          // color: Color(0xff5dc8f8),
                          fontSize: 70,
                          color: Colors.white,
                          fontFamily: "Gilroy",
                          shadows: const [
                            BoxShadow(
                              blurRadius: 17.0,
                              spreadRadius: 15,
                              color: Color(0xff5dc8f8),
                            ),
                          ],
                        ),
                        children: [
                          TextSpan(
                            text: "Sunny",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                //color: Color(0xff065a9d),
                                fontSize: 70,
                                color: Colors.white,

                                height: 0.7
                            ),
                          ),
                        ]
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              SizedBox(
                height: 30
              ),
              const Texter(
                "Mobile developer | Tech Enthusiast\nOn a mission to make clean app UI/UX\nFlutter | Dart ",
                style: TextStyle(
                    fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff0c0c0c)
                ),
              ),
              SizedBox(
                height: screenHeight(context, mulBy: 0.1),
              ),
              const Texter(
                "I'm a",
                style: TextStyle(
                    fontSize: 34
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: screenHeight(context, mulBy: 0.1),
                  width: 400,
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w100,
                      color: Colors.white.withOpacity(0.9),
                      shadows: const [
                        BoxShadow(
                          blurRadius: 17.0,
                          spreadRadius: 20,
                          color: Color(0xff5dc8f8),
                        ),
                      ],
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      pause: const Duration(seconds: 1),
                      animatedTexts: [
                        FlickerAnimatedText(
                          'App Developer',
                        ),
                        FlickerAnimatedText(
                          'Speaker',
                        ),
                        FlickerAnimatedText(
                          'Engineer',
                        ),
                        FlickerAnimatedText(
                          'Designer',
                        ),
                      ],
                      displayFullTextOnTap: true,
                    ),
                  ),
                ),
              )
            ],
          ),
          ContactCard(),
        ],
      ),
    );
  }
}
