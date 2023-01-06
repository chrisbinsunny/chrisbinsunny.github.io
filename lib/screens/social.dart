

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
      height: screenHeight(context),
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
      constraints:const BoxConstraints(
      minWidth: 500,
        minHeight:  725,
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: const [
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     SizedBox(
          //       height: screenHeight(context, mulBy: 0.3),
          //       child: const Imager(
          //         altText: "QR code to get Chrisbin's contact vCard",
          //         path:"images/qrCode.png",
          //         imageFit: BoxFit.scaleDown,
          //       ),
          //     ),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     const Texter("  Chrisbin Sunny",
          //       style: TextStyle(
          //         fontSize: 24,
          //         fontWeight: FontWeight.w600
          //       ),
          //     ),
          //     const SizedBox(
          //       height: 2,
          //     ),
          //     const Texter("   App Developer | Speaker",
          //       style: TextStyle(
          //           fontSize: 15,
          //           fontWeight: FontWeight.w200
          //       ),
          //     ),
          //     const SizedBox(
          //       height: 30,
          //     ),
          //     TextButton(
          //         onPressed: (){},
          //         child: const Text(
          //             " (IND)  +91 83300 70512",
          //           style: TextStyle(
          //               fontSize: 15,
          //               color: Colors.white,
          //               fontWeight: FontWeight.w200
          //           ),
          //         ),
          //     ),
          //     const SizedBox(
          //       height: 2,
          //     ),
          //     TextButton(
          //       onPressed: (){},
          //       child: const Text(
          //         " chrisbinofficial@gmail.com",
          //         style: TextStyle(
          //             fontSize: 15,
          //             color: Colors.white,
          //             fontWeight: FontWeight.w200
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          ContactCard()
        ],
      ),
    );
  }
}


class ContactCard extends StatefulWidget {
  const ContactCard({Key? key}) : super(key: key);

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> animation;
  double dragPosition = 0;
  bool isFront = true, isFrontStart=true;

  Widget frontSide= Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 17,
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
      Row(
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
            fontWeight: FontWeight.w100,
            letterSpacing: 1,
            height: 1.7,
            fontFamily: "Gilroy",
          ),
          ),
        ],
      ),
      const SizedBox(
        height: 2,
      ),
      Row(
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
      const SizedBox(
        height: 2,
      ),
      Row(
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
      ),
      const SizedBox(
        height: 2,
      ),
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
      ),

    ],
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
          height: 10,
        ),
        SizedBox(
          width: constraints.maxWidth*0.7,
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
          width: constraints.maxWidth*0.65,
          child: FittedBox(
            child: const Texter("  App Developer | Speaker",
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
        TextButton(
          onPressed: () {},
          child: const Text(
            " (IND)  +91 83300 70512",
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w200
            ),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            " chrisbinofficial@gmail.com",
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w200
            ),
          ),
        ),
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
                  height: 320,
                  width: 200,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12  //12
                  ),
                  decoration: BoxDecoration(
                      color: const Color(0xff0c0c0c),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: isFront ?
                  back :
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
          CustomPaint(foregroundPainter: CircleBlurPainter( blurSigma: 11))
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

}


class CircleBlurPainter extends CustomPainter {

  CircleBlurPainter({required this.blurSigma});

  double blurSigma;

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = const Color(0xff8a8a8a)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
    canvas.drawOval(const Rect.fromLTRB(-110, 0, 110, 13), line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}