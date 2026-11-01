


import 'package:flutter/material.dart';
import 'package:portfolio/sizes.dart';
import 'package:portfolio/widgets/widgets.dart';

class About extends StatefulWidget {
  const About({super.key});

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
                      "Today I'm a Flutter engineer with 7+ years of shipping mobile, web, TV and automotive apps, "
                      "from a kids' learning app with 5M+ downloads to a social app I built and launched solo.\n\n"
                      "I'm a Frontend Engineer at Kutuki and the founder of Tethxr. "
                      "I also maintain open source Flutter packages like blurhashx and Flippy.\n\n"
                      "I love making technology accessible to everyone. I've conducted 7 workshops and delivered 9+ talks on Flutter and programming, "
                      "won 1st prize at the Amazon Alexa Use Case Competition (KSUM) and 2nd prize at the Hack19 Flutter International Hackathon.",
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
                  "Flutter, Dart, Go, Python, Supabase, Firebase, PostgreSQL, AWS S3, BLoC, GetX, RevenueCat",
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
