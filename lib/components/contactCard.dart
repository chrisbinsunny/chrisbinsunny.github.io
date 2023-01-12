import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/variables.dart';
import 'package:portfolio/firebase/analytics.dart';
import 'package:portfolio/sizes.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ContactCard extends StatefulWidget {
  const ContactCard({super.key, });

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> animation;
  double dragPosition = 0;
  bool isFront = true, isFrontStart=true;

  Widget frontSide= LayoutBuilder(
      builder: (p0, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: constraints.maxHeight*0.1
            ),
            const Center(
              child: SizedBox(
                height: 110,
                child: Imager(
                  path: "images/macGuy.png",
                  altText: "Memoji using macbook. WWDC",
                  colorBlendMode: BlendMode.plus,
                  alignment: Alignment.center,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 33
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,

                child: RichTexter(
                  text: "Chrisbin Sunny",
                  child: RichText(
                    text: const TextSpan(
                        text: "Chrisbin\n",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Color(0xff5dc8f8),
                            fontSize: 32,
                            fontFamily: "Gilroy",
                            letterSpacing: 1.5
                        ),
                        children: [
                          TextSpan(
                            text: "Sunny",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xff065a9d),
                                fontSize: 35,
                                height: 0.9,
                                letterSpacing: 0.5

                            ),
                          ),
                        ]
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: constraints.maxWidth*0.42,
              child: FittedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.squareGithub,
                      color: Colors.white,
                      size: 11,
                    ),
                    Text(
                      "  chrisbinsunny",
                      style: TextStyle(
                        fontSize: 7,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 1,
                        height: 1.7,
                        fontFamily: "Gilroy",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            SizedBox(
              width: constraints.maxWidth*0.42,

              child: FittedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: Colors.white,
                      size: 11,
                    ),
                    Text(
                      "  chrisbinsunny",
                      style: TextStyle(
                        fontSize: 7,
                        fontWeight: FontWeight.w100,
                        letterSpacing: 1,
                        height: 1.7,
                        fontFamily: "Gilroy",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            SizedBox(
                width: constraints.maxWidth*0.42,

                child: FittedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.squareTwitter,
                        color: Colors.white,
                        size: 11,
                      ),
                      Text(
                        "  chrisbinsunny",
                        style: TextStyle(
                          fontSize: 7,
                          fontWeight: FontWeight.w100,
                          letterSpacing: 1,
                          height: 1.7,
                          fontFamily: "Gilroy",
                        ),
                      ),
                    ],
                  ),)),
            const SizedBox(
              height: 2,
            ),
            SizedBox(
                width: constraints.maxWidth*0.64,

                child: FittedBox(
                  child:
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.chrome,
                        color: Colors.white,
                        size: 10,
                      ),
                      Text(
                        "  chrisbinsunny.github.io",
                        style: TextStyle(
                          fontSize: 7,
                          fontWeight: FontWeight.w100,
                          letterSpacing: 1,
                          height: 1.7,
                          fontFamily: "Gilroy",
                        ),
                      ),
                    ],
                  ),))

          ],
        );}
  );
  Widget back = LayoutBuilder(

    builder: (p0, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Imager(
            altText: "QR code to get Chrisbin's contact vCard",
            path: "images/qrCode.png",
            imageFit: BoxFit.fitWidth,
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: constraints.maxWidth*0.65,
            child: const FittedBox(
              child: Texter(" Chrisbin Sunny",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          SizedBox(
            width: constraints.maxWidth*0.6,
            child: const FittedBox(
              child: Texter("  App Developer | Speaker",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: constraints.maxWidth*0.55,
            child: const FittedBox(
              child: Texter(
                " (IND)  +91 83300 70512",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w300
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          SizedBox(
            width: constraints.maxWidth*0.65,
            child: const FittedBox(
              child: Texter(
                " chrisbinofficial@gmail.com",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontFamily: "Gilroy",
                    fontWeight: FontWeight.w300
                ),
              ),
            ),
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const FlutterLogo(
                size: 20,
              ),
              Texter(
                " FlutterDev",
                style: TextStyle(
                    fontSize: 17,
                    color: null,
                    fontFamily: "Gilroy",
                    fontWeight: FontWeight.w500,
                    foreground: Paint()..shader=const LinearGradient(
                        colors: <Color>[Color(0xff5dc8f8), Color(0xff065a9d)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                    ).createShader(const Rect.fromLTWH(0.0, 0.0, 50.0, 20.0))
                ),
              )
            ],
          )
        ],
      );
    },);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration (milliseconds: 500),
      vsync: this,
    );

    controller.addListener(() {
      setState(() {
        dragPosition = animation.value;
        setImageSide();
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final angle = dragPosition / 180 * pi;
    final transform = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateY(angle);
    return GestureDetector(
      onHorizontalDragStart: (details){
        AnalyticsService.logEvent(
            "contactCardPlayed",
        );
        controller.stop();
        isFrontStart= isFront;
      },
      onHorizontalDragUpdate: (details) {
        setState(() {
          dragPosition -= details.delta.dx;
          dragPosition %= 360;
          setImageSide();
        });
      },
      onHorizontalDragEnd: (details){
        final velocity= details.velocity.pixelsPerSecond.dx.abs();
        if (velocity >= 100) {
          isFront = !isFrontStart;
        }
        animation = Tween<double>(
          begin: dragPosition,
          end: isFront? (dragPosition > 180 ? 360:0):180,
        ).animate (controller);
        controller.forward(from: 0);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [

          Transform(
            transform: transform,
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Shimmer(
                colorOpacity: .1,
                duration: const Duration(seconds: 5),
                child: Container(
                  height: 384,
                  width: 240,
                  padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12  //12
                  ),
                  decoration: BoxDecoration(
                      color: const Color(0xff0c0c0c),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: isFront ?
                  frontSide :
                  Transform(
                    transform: Matrix4.identity()
                      ..rotateY(pi),
                    alignment: Alignment.center,
                    child: back,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomPaint(foregroundPainter: CircleBlurPainter( blurSigma: 11, width: getWidth())),
          const SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: (){
              AnalyticsService.logEvent(
                "contactMeClicked",
              );
              Variables.scrollController.position
                  .ensureVisible(
                  Variables.keys[3].currentContext!.findRenderObject()!,
                  curve: Curves.easeInOut,

                  duration: const Duration(seconds: 1),
                  alignment: -0.7
              );
            },
            child: Container(
              height: 45,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).secondaryHeaderColor
                    ],
                    stops: [
                      0,
                      0.8
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
              ),
              alignment: Alignment.center,
              child: Texter(
                "Contact Me",
                select: false,
                style: TextStyle(
                  fontSize: 22,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


  void setImageSide() {
    if (dragPosition <= 90 || dragPosition >= 270) {
      isFront = true;
    } else {
      isFront = false;
    }
  }

  getWidth(){
    return dragPosition>180?(130+(180-dragPosition)*1.44):130-(dragPosition*1.44);
  }


}


class CircleBlurPainter extends CustomPainter {

  CircleBlurPainter({required this.blurSigma, required this.width});

  double blurSigma, width;

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = const Color(0xff8a8a8a)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
    canvas.drawOval(Rect.fromLTRB(-(width), 3, width, 10), line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
