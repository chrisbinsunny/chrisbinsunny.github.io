

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
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
      height: screenHeight(context),  ///Reducing 70 for appbar
      color: const Color(0xff0c0c0c),
      constraints:const BoxConstraints(
      minWidth: 500,
        minHeight:  725,  ///Reducing 70 for appbar
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Seo.text(
                text: "App Developer | Engineer | Designer | Speaker",
                child: Text(
                  "Flutter Dart Firebase Supabase Google Cloud Maps GoLang "*10,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 80,
                      color: Color(0x53093c0)
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                width: constraints.maxWidth,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHeight(context, mulBy: 0.08),
                    ),
                    const SizedBox(
                      height: 250,
                      child: Imager(
                        path: "images/macGuy.png",
                        altText: "Memoji using macbook. WWDC",
                        colorBlendMode: BlendMode.colorDodge,
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
                                color: Color(0xff5dc8f8),
                                fontSize: 70,
                              fontFamily: "Gilroy"
                            ),
                            children: [
                              TextSpan(
                                  text: "Sunny",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff065a9d),
                                    fontSize: 70,
                                    height: 0.7
                                ),
                              ),
                            ]
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context, mulBy: 0.03),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                        alignment: Alignment.center,
                        height: screenHeight(context, mulBy: 0.25),
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
              )
            ],
          );
        },
      ),
    );
  }
}
