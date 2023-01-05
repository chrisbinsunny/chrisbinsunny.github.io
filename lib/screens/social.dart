

import 'dart:async';
import 'dart:math';
import 'dart:developer' as dev;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
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
        children: [
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
          const ContactCard()
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

  Widget front = Container(
    color: Colors.green,
  );

  Widget back = Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 70,
          child: Imager(
            altText: "QR code to get Chrisbin's contact vCard",
            path: "images/qrCode.png",
            imageFit: BoxFit.scaleDown,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Texter("  Chrisbin Sunny",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        const Texter("   App Developer | Speaker",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w200
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
    ),
  );

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
            child: Shimmer(
              colorOpacity: .1,
              duration: Duration(seconds: 5),
              child: Container(
                height: 320,
                width: 200,
                decoration: BoxDecoration(
                  color: const Color(0xff1a1a1a),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: isFront ?
                front :
                Transform(
                  transform: Matrix4.identity()
                    ..rotateY(pi),
                  alignment: Alignment.center,
                    child: back,
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