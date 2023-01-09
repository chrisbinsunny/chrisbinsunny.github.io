

import 'dart:async';
import 'dart:math';
import 'dart:developer' as dev;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/sizes.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:seo/html/seo_widget.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class Social extends StatefulWidget {
  const Social({Key? key}) : super(key: key);

  @override
  State<Social> createState() => _SocialState();
}

class _SocialState extends State<Social> {
  @override
  Widget build(BuildContext context) {



    return Container(
      width: screenWidth(context, mulBy: 1),
      //height: screenHeight(context),
      padding: EdgeInsets.only(
        left: screenWidth(context, mulBy: 0.15),
        right: screenWidth(context, mulBy: 0.15),
        top: 80

      ),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Texter(
            "I'm Social",
            textAlign: TextAlign.end,
            style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w700
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          SizedBox(

            width: screenWidth(context, mulBy: 0.6),
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 20,
              runSpacing: 20,
              children: [
                SocialButton(topic: "Location", text:"Kerala, India", onTap: (){}, icon: Icons.pin_drop, large: true,),
                SocialButton(topic: "Email", text:"chrisbinofficial@gmail.com", onTap: (){}, icon: Icons.email, large: true,),
                SocialButton(topic: "Phone", text:"+91 83300 70512", onTap: (){}, icon: Icons.phone, large: true,),

              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: screenWidth(context, mulBy: 0.6),

            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 20,
              children: [
                SocialButton(topic: "GitHub", onTap: (){}, icon: FontAwesomeIcons.github),
                SocialButton(topic: "Twitter", onTap: (){}, icon: FontAwesomeIcons.twitter),
                SocialButton(topic: "LinkedIn", onTap: (){}, icon: FontAwesomeIcons.linkedin),
                SocialButton(topic: "Instagram", onTap: (){}, icon: FontAwesomeIcons.instagram),
              ],
            ),
          )
        ],
      ),
    );
  }
}



class SocialButton extends StatelessWidget {
  const SocialButton({Key? key, this.large=false, this.text="", required this.topic, required this.onTap, required this.icon}) : super(key: key);

  final IconData icon;
  final VoidCallback onTap;
  final String topic, text;
  final bool large;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: large?
      Container(
        height: 170,
        width: 300,
        padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15
        ),
        constraints: const BoxConstraints(
          minWidth: 100,
          minHeight: 100,
        ),
        decoration: BoxDecoration(
          color: const Color(0xff2a2a2a),
          borderRadius: BorderRadius.circular(15),

        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon,
          color: Theme.of(context).primaryColor,
            size: 28,
          ),
          Texter(
            topic.toUpperCase(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),
          ),
          Texter(
            text,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400
            ),
          )
        ],
      ),
      ):
      Container(
        height: screenHeight(context, mulBy: 0.14),
        width: screenWidth(context, mulBy: 0.07),

        constraints: const BoxConstraints(
          minWidth: 100,
          minHeight: 100,
        ),
        decoration: BoxDecoration(
          color: const Color(0xff2a2a2a),
          borderRadius: BorderRadius.circular(15),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon,
              color: Theme.of(context).primaryColor,
              size: 28,
            ),
            Texter(
              topic.toUpperCase(),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
      ),
    );
  }
}
