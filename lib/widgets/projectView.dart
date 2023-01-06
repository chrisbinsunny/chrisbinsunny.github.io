import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/sizes.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:portfolio/widgets/widgets.dart';

// class ProjectView extends StatefulWidget {
//   const ProjectView({Key? key, required this.name, required this.image, required this.altText, required this.desc, required this.github, required this.link}) : super(key: key);
//
//   final String name, image, altText, desc, github, link;
//
//   @override
//   State<ProjectView> createState() => _ProjectViewState();
// }
//
// class _ProjectViewState extends State<ProjectView> {
//
//   final ScrollController scrollController= ScrollController();
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       //elevation: 20,
//       insetPadding: EdgeInsets.symmetric(
//         vertical: 24,
//         horizontal: 20
//       ),
//       alignment: Alignment.center,
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           if(constraints.maxWidth>1090) {
//             return Container(
//               height: 430,
//               // width: screenWidth(context, mulBy: 0.6),
//               decoration: BoxDecoration(
//                   color: const Color(0xff111111),
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(color: Colors.white, width: 0.6)),
//
//               padding: const EdgeInsets.symmetric(
//                   vertical: 30,
//                   horizontal: 30
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//               children: [
//                 Column(
//                   // mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Texter(
//                       name,
//                       style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 34,
//                           color: Theme.of(context).secondaryHeaderColor),
//                     ),
//                     Container(
//                       width: screenWidth(context, mulBy: 0.3),
//                       constraints: const BoxConstraints(
//                         maxHeight: 250,
//                         minWidth: 400,
//                       ),
//                       child: Texter(
//                         desc,
//                         style: const TextStyle(
//                             fontWeight: FontWeight.w300,
//                             fontSize: 17,
//                             color: Colors.white),
//                       ),
//                     ),
//
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         InkWell(
//                           onTap: (){},
//                           child: Container(
//                             height: 50,
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 10
//                             ),
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               gradient: const LinearGradient(
//                                 colors: [
//                                   Color(0xff5dc8f8),
//                                   Color(0xff065a9d)
//                                 ],
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter
//                               )
//                             ),
//                             child: const Texter(
//                               "View Project 🚀",
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         InkWell(
//                           onTap: (){},
//                           child: Container(
//                             height: 50,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 10
//                             ),
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 gradient: const LinearGradient(
//                                     colors: [
//                                       Color(0xff5dc8f8),
//                                       Color(0xff065a9d)
//                                     ],
//                                     begin: Alignment.topCenter,
//                                     end: Alignment.bottomCenter
//                                 )
//                             ),
//                             child: const Texter(
//                               "View GitHub 💻",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//                 Container(
//                   width: screenWidth(context, mulBy: 0.35),
//                   constraints: const BoxConstraints(
//                       minWidth: 500
//                   ),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       border: Border.all(color: Colors.white, width: 0.6)),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(15),
//                     child: Imager(
//                       altText: altText,
//                       path: image,
//                     ),
//                   ),
//                 ),
//               ],
//           ),
//             );
//           }
//           return Container(
//             //height: screenHeight(context, mulBy: 0.49),
//             width: screenWidth(context, mulBy: 0.6),
//             decoration: BoxDecoration(
//                 color: const Color(0xff111111),
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(color: Colors.white, width: 0.6)),
//             constraints: const BoxConstraints(
//               minHeight: 430,
//               maxWidth: 500
//             ),
//             padding: const EdgeInsets.symmetric(
//                 vertical: 20,
//                 horizontal: 20
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   width: constraints.maxWidth*0.6,
//                   constraints: const BoxConstraints(
//                       minWidth: 250
//                   ),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       border: Border.all(color: Colors.white, width: 0.6)),
//                   margin: EdgeInsets.only(
//                     bottom: 10
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(15),
//                     child: Imager(
//                       altText: altText,
//                       path: image,
//                     ),
//                   ),
//                 ),
//
//                 Texter(
//                   name,
//                   style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 34,
//
//                       color: Theme.of(context).secondaryHeaderColor),
//                 ),
//                 Container(
//                   width: constraints.maxWidth*0.6,
//                   constraints: const BoxConstraints(
//                     maxHeight: 220,
//                     minWidth: 250,
//                   ),
//                   child: ShaderMask(
//                     blendMode: BlendMode.srcIn,
//                     shaderCallback: (bounds) => LinearGradient(
//                       colors: [
//                         Colors.black.withAlpha(0),
//                         Colors.white,
//                         Colors.white,
//                         Colors.black.withAlpha(0),
//                       ],
//                       stops: const [
//                         0,
//                         0.1,
//                         0.9,
//                         1
//                       ],
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                     ).createShader(
//                       Rect.fromLTWH(0, 0, bounds.width, bounds.height),
//                     ),
//                     child: CupertinoScrollbar(
//                       controller: scrollController,
//                       thickness: 2,
//                       thumbVisibility: false,
//                       child: ScrollConfiguration(
//                         behavior:
//                         ScrollConfiguration.of(context).copyWith(scrollbars: false),
//                       child: SingleChildScrollView(
//                         controller: scrollController,
//                         physics: BouncingScrollPhysics(),
//                         child: Texter(
//                           "\n${desc}\n",
//                           style: const TextStyle(
//                               fontWeight: FontWeight.w300,
//                               fontSize: 15.5,
//
//                               color: Colors.white),
//                         ),
//                       ),),
//                     ),
//                   ),
//                 ),
//
//                 FittedBox(
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       InkWell(
//                         onTap: (){
//                           html.window.open(github, 'new tab');
//                         },
//                         child: Container(
//                           height: 40,
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10
//                           ),
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               gradient: const LinearGradient(
//                                   colors: [
//                                     Color(0xff5dc8f8),
//                                     Color(0xff065a9d)
//                                   ],
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter
//                               )
//                           ),
//                           child: const Texter(
//                             "Launch 🚀",
//                             style: TextStyle(
//                                 color: Colors.black,
//
//
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: screenWidth(context, mulBy: 0.03),
//                       ),
//                       InkWell(
//                         onTap: (){
//                           html.window.open(link, 'new tab');
//                         },
//                         child: Container(
//                           height: 40,
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10
//                           ),
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               gradient: const LinearGradient(
//                                   colors: [
//                                     Color(0xff5dc8f8),
//                                     Color(0xff065a9d)
//                                   ],
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter
//                               )
//                           ),
//                           child: const Texter(
//                             "GitHub 💻",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 16,
//
//                                 fontWeight: FontWeight.w600
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


class ProjectView extends StatelessWidget {


  ProjectView({Key? key, required this.name, required this.image, required this.altText, required this.desc, required this.github, required this.link}) : super(key: key);

  final String name, image, altText, desc, github, link;
  final ScrollController scrollController= ScrollController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      //elevation: 20,
      insetPadding: EdgeInsets.symmetric(
          horizontal: 20
      ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Texter(
                              name,
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 34,
                                  color: Theme.of(context).secondaryHeaderColor),
                            ),
                            Container(
                              height: 1.5,
                              width: screenWidth(context, mulBy: 0.27),
                              constraints: const BoxConstraints(
                                minWidth: 380,
                              ),
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: screenWidth(context, mulBy: 0.3),
                        constraints: const BoxConstraints(
                          maxHeight: 250,
                          minWidth: 400,
                        ),
                        child: Texter(
                          desc,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 17,
                              color: Colors.white),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              html.window.open(link, 'new tab');

                            },
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
                                "Launch Project \u{1F680}",
                                select: false,

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
                            onTap: (){
                              html.window.open(github, 'new tab');

                            },
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
                                "View GitHub \u{1F4BB}",
                                select: false,

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
                        altText: altText,
                        path: image,
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
                vertical: 20,
                horizontal: 20
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
                  margin: EdgeInsets.only(
                      bottom: 10
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Imager(
                      altText: altText,
                      path: image,
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Texter(
                    name,
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 34,

                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                ),
                Container(
                  height: 1.5,
                  color: Theme.of(context).primaryColor,
                ),
                Container(
                  width: constraints.maxWidth*0.6,
                  constraints: const BoxConstraints(
                    maxHeight: 220,
                    minWidth: 250,
                  ),
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [
                        Colors.black.withAlpha(0),
                        Colors.white,
                        Colors.white,
                        Colors.black.withAlpha(0),
                      ],
                      stops: const [
                        0,
                        0.1,
                        0.9,
                        1
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                    child: CupertinoScrollbar(
                      controller: scrollController,
                      thickness: 2,
                      thumbVisibility: false,
                      child: ScrollConfiguration(
                        behavior:
                        ScrollConfiguration.of(context).copyWith(scrollbars: false),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          physics: BouncingScrollPhysics(),
                          child: Texter(
                            "\n${desc}\n",
                            style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15.5,

                                color: Colors.white),
                          ),
                        ),),
                    ),
                  ),
                ),

                FittedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: (){
                          html.window.open(link, 'new tab');
                        },
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
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
                            "Launch \u{1F680}",
                            select: false,

                            style: TextStyle(
                                color: Colors.black,


                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth(context, mulBy: 0.03),
                      ),
                      InkWell(
                        onTap: (){
                          html.window.open(github, 'new tab');
                        },
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
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
                            "GitHub \u{1F4BB}",
                            select: false,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,

                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
