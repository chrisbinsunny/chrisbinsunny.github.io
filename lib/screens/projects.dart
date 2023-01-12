import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/firebase/analytics.dart';
import 'package:portfolio/sizes.dart';
import 'package:portfolio/widgets/projectView.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:seo/html/seo_widget.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, mulBy: 1),
      //height: screenHeight(context)-70,  ///Reducing 70 for appbar
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xff0c0c0c),
                Color(0xff0f1617),
                Color(0xff0c0c0c),

              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
      ),
      //color: Colors.green,
      constraints: BoxConstraints(
        minWidth: 500,
        minHeight: screenHeight(context) ,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context, mulBy: 0.05),
          vertical: screenHeight(context, mulBy: 0.07)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Texter(
            "Open Source Projects",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 34,
                color: Theme.of(context).secondaryHeaderColor),
          ),
          const SizedBox(
            height: 35,
          ),
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceEvenly,
            runAlignment: WrapAlignment.spaceEvenly,
            spacing: 100,
            runSpacing: 40,
            children: const [
              ProjectItem(
                  name: "ChrisHub",
                  image: "images/chrishub.jpg",
                  projectDetails: ProjectDetails(
                    name: "ChrisHub",
                    image: "images/chrishubWeb.jpg",
                      altText: "Home screen of chrishub- Chrisbin's Macbook Pro",
                      desc: "\u{25ca} A portfolio website built as a Web Simulation of macOS Big Sur.\n"
                      "\u{25ca} Implemented Terminal, Safari, Messages, VSCode, Spotify, etc.\n"
                    "\u{25ca} Integrated features like create/delete folder, change brightness,wallpaper, etc.\n"
                    "\u{25ca} Used Provider for managing the state and Hive as local database.\n"
                    "\u{25ca} Tech stack: Flutter, Firebase, Hive ",
                    github: "https://github.com/chrisbinsunny/chrishub",
                      link: "https://chrisbinsunny.github.io/chrishub",
                  ),
              ),
              ProjectItem(
                name: "D R E A M",
                image: "images/dream.png",
                imageFit: BoxFit.contain,
                projectDetails: ProjectDetails(
                  name: "DREAM- Color Finder",
                  image: "images/dreamWeb.jpg",
                  altText: "Home screen of Dream color finder and gradient maker.",
                  desc: "\u{25ca} A website built to find colours from images and screenshots.\n"
                  "\u{25ca} Implemented a gradient builder to create website backgrounds.\n"
               "\u{25ca} Integrated CSS code copying and sharing.\n"
                "\u{25ca} Used Provider for managing the state.\n"
                "\u{25ca} Tech stack: Flutter",
                  github: "https://github.com/chrisbinsunny/dream",
                  link: "https://chrisbinsunny.github.io/dream",
                ),
              ),
              ProjectItem(
                name: "Flutter Talks",
                image: "images/flutterTalks.jpg",
                projectDetails: ProjectDetails(
                  name: "Flutter Talks by Chrisbin",
                  image: "images/flutterTalksWeb.jpg",
                  altText: "Home screen of Flutter talks by Chrisbin Sunny.\n",
                  desc: "\u{25ca} A presentation website to be shown at the intro session of workshops.\n"
                  "\u{25ca} The website shows Intro to Flutter slides and is to be controlled by arrow keys.\n"
                      "\u{25ca} Can be controlled by using the link to each slide.\n"
                      "\u{25ca} Used Provider for managing the state.\n"
                      "\u{25ca} Tech stack: Flutter",
                  github: "https://github.com/chrisbinsunny/Flutter-Talks",
                  link: "https://chrisbinsunny.github.io/Flutter-Talks",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  const ProjectItem(
      {Key? key,
      required this.name,
      required this.image,
      this.imageFit = BoxFit.cover,
      required this.projectDetails})
      : super(key: key);

  final String image, name;
  final BoxFit imageFit;
  final ProjectDetails projectDetails;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AnalyticsService.logProject(
          projectDetails.name,
        );
        showDialog(
          barrierColor: Color(0x98021a2d),
          context: context,
          builder: (context) {
            return ProjectView(
              name: projectDetails.name,
              image: projectDetails.image,
              altText: projectDetails.altText,
              link: projectDetails.link,
              desc: projectDetails.desc,
              github: projectDetails.github,
            );
          },
        );
      },
      child: Column(
        children: [
          Container(
            width: 260,
            height: 180,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                color: const Color(0xff0c0c0c),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x2dffffff), spreadRadius: 3, blurRadius: 15)
                ]),
            child: Imager(
              path: image,
              altText: "Project item image which shows $image.",
              imageFit: imageFit,
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Texter(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                fontFamily: "Gilroy",
                color: Color(0xffffffff)),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}

class ProjectDetails {
  final String image, altText, desc, github, link, name;

  const ProjectDetails(
      {required this.image,
      required this.altText,
      required this.desc,
      required this.github,
        required this.name,
      required this.link});
}
