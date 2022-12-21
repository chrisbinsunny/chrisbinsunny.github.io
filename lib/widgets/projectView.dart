import 'package:flutter/material.dart';
import 'package:portfolio/sizes.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:portfolio/widgets/widgets.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({Key? key, required this.name, required this.image, required this.altText, required this.desc, required this.github, required this.link}) : super(key: key);

  final String name, image, altText, desc, github, link;

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {


  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      //elevation: 20,

      alignment: Alignment.center,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth>1090) {
            return Container(
              height: 430,
              // width: screenWidth(context, mulBy: 0.6),
              decoration: BoxDecoration(
                  color: const Color(0xff111111),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white, width: 0.6)),

              padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 30
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Texter(
                      widget.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 34,
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                    Container(
                      width: screenWidth(context, mulBy: 0.3),
                      constraints: const BoxConstraints(
                        maxHeight: 250,
                        minWidth: 400,
                      ),
                      child: Texter(
                        widget.desc,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff5dc8f8),
                                  Color(0xff065a9d)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter
                              )
                            ),
                            child: const Texter(
                              "View Project 🚀",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xff5dc8f8),
                                      Color(0xff065a9d)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter
                                )
                            ),
                            child: const Texter(
                              "View GitHub 💻",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  width: screenWidth(context, mulBy: 0.35),
                  constraints: const BoxConstraints(
                      minWidth: 500
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white, width: 0.6)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Imager(
                      altText: widget.altText,
                      path: widget.image,
                    ),
                  ),
                ),
              ],
          ),
            );
          }
          return Container(
            //height: screenHeight(context, mulBy: 0.49),
            width: screenWidth(context, mulBy: 0.6),
            decoration: BoxDecoration(
                color: const Color(0xff111111),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white, width: 0.6)),
            constraints: const BoxConstraints(
              minHeight: 430,
              maxWidth: 500
            ),
            padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 30
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: constraints.maxWidth*0.6,
                  constraints: const BoxConstraints(
                      minWidth: 250
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white, width: 0.6)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Imager(
                      altText: widget.altText,
                      path: widget.image,
                    ),
                  ),
                ),
                Texter(
                  widget.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 34,
                      color: Theme.of(context).secondaryHeaderColor),
                ),
                Container(
                  width: constraints.maxWidth*0.6,

                  constraints: const BoxConstraints(
                    maxHeight: 250,
                    minWidth: 250,
                  ),
                  child: Texter(
                    widget.desc,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                                colors: [
                                  Color(0xff5dc8f8),
                                  Color(0xff065a9d)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter
                            )
                        ),
                        child: const Texter(
                          "View Project 🚀",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                                colors: [
                                  Color(0xff5dc8f8),
                                  Color(0xff065a9d)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter
                            )
                        ),
                        child: const Texter(
                          "View GitHub 💻",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
