import 'dart:developer' as dev;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/sizes.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Social extends StatefulWidget {
  const Social({Key? key}) : super(key: key);

  @override
  State<Social> createState() => _SocialState();
}

class _SocialState extends State<Social> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    return Container(
      width: screenWidth(context, mulBy: 1),
      //height: screenHeight(context),
      padding: EdgeInsets.only(
        left: 15,
        right: 15,

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
        minHeight: screenHeight(context)-70,
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
          Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.spaceEvenly,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: [
              const SocialButton(topic: "Location", text:"Kerala, India",
                link: "https://keralatourism.org",
                onTap: null, icon: Icons.pin_drop, large: true,),
              SocialButton(topic: "Email",
                text:"chrisbinofficial@gmail.com",
                link:"mailto:chrisbinofficial@gmail.com",
                onTap: () async{
                try {
                  await launchUrl(Uri(
                      scheme: 'mailto',
                      path: 'chrisbinofficial@gmail.com',
                  ));

                } catch (e) {
                  dev.log(e.toString());
                  await Clipboard.setData(const ClipboardData(text: 'chrisbinofficial@gmail.com'));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Texter("Email Copied")));
                }
              },
                icon: Icons.email, large: true,),
              SocialButton(topic: "Phone",
                link:"tel:+918330070512",
                text:"+91 83300 70512",
                onTap: () async{
                  try {
                    await launchUrl(Uri(
                      scheme: 'tel',
                      path: '+918330070512',
                    ));

                  } catch (e) {
                    dev.log(e.toString());
                    await Clipboard.setData(const ClipboardData(text: '+918330070512'));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Texter("Number Copied")));
                  }
                },
                icon: Icons.phone, large: true,),

            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: [
              SocialButton(
                  topic: "GitHub",
                  link: "https://github.com/chrisbinsunny",
                  onTap: () async{
                try {
                  await launchUrl(Uri(
                    scheme: 'https',
                    path: 'github.com/chrisbinsunny',
                  ));

                } catch (e) {
                  await Clipboard.setData(const ClipboardData(text: 'https://github.com/chrisbinsunny'));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Texter("Link Copied")));
                }
              },
                  icon: FontAwesomeIcons.github),
              SocialButton(topic: "Twitter",
                  link:"https://twitter.com/chrisbinsunny",
                  onTap: () async{
                    try {
                      await launchUrl(Uri(
                        scheme: 'https',
                        path: 'twitter.com/chrisbinsunny',
                      ));

                    } catch (e) {
                      await Clipboard.setData(const ClipboardData(text: 'https://twitter.com/chrisbinsunny'));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Texter("Link Copied")));
                    }
                  },
                  icon: FontAwesomeIcons.twitter),
              SocialButton(topic: "LinkedIn",
                  link: "https://linkedin.com/in/chrisbinsunny",

                  onTap: () async{
                try {
                  await launchUrl(Uri(
                    scheme: 'https',
                    path: 'linkedin.com/in/chrisbinsunny',
                  ));

                } catch (e) {
                  await Clipboard.setData(const ClipboardData(text: 'https://linkedin.com/in/chrisbinsunny'));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Texter("Link Copied")));
                }
              }, icon: FontAwesomeIcons.linkedin),
              SocialButton(
                  topic: "Instagram",
                  link: "https://instagram.com/binary.ghost",
                  onTap: () async{
                try {
                  await launchUrl(Uri(
                    scheme: 'https',
                    path: 'instagram.com/binary.ghost',
                  ));

                } catch (e) {
                  await Clipboard.setData(const ClipboardData(text: 'https://instagram.com/binary.ghost'));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Texter("Link Copied")));
                }
              }, icon: FontAwesomeIcons.instagram),
            ],
          ),

        ],
      ),
    );
  }
}



class SocialButton extends StatelessWidget {
  const SocialButton({Key? key, this.large=false, this.text="", required this.link, required this.topic, required this.onTap, required this.icon}) : super(key: key);

  final IconData icon;
  final VoidCallback? onTap;
  final String topic, text, link;
  final bool large;

  @override
  Widget build(BuildContext context) {
    return Linker(
      name: topic,
      link: link,
      child: InkWell(
        onTap: onTap,
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
            FittedBox(
              child: Texter(
                text,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                ),
              ),
            )
          ],
        ),
        ):
        Container(
          height: 140,
          width: 140,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15
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
                topic,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
