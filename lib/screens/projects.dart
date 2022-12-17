

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Texter(
            "Open Source Projects",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 34,
                color: Theme.of(context).secondaryHeaderColor
            ),
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
              ProjectItem(name: "ChrisHub", image: "images/chrishub.jpg",),
              ProjectItem(name: "D R E A M", image: "images/dream.png", imageFit: BoxFit.contain,),
              ProjectItem(name: "Flutter Talks", image: "images/flutterTalks.jpg",),
            ],
          )
        ],
      ),
    );
  }
}


class ProjectItem extends StatelessWidget {
  const ProjectItem({Key? key, required this.name, required this.image, this.imageFit=BoxFit.cover}) : super(key: key);

  final String image, name;
  final BoxFit imageFit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showDialog(
          barrierColor: Colors.black.withOpacity(0.15),
          context: context,
          builder: (context) {
            return const ProjectView();
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
                      color: Color(0x2dffffff),
                      spreadRadius: 3,
                      blurRadius: 15
                  )
                ]
            ),
            child: Image.asset(
              image,
              fit: imageFit,
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
                color: Color(0xffffffff)
            ),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}
